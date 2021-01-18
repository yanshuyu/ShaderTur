Shader "Custom/Phong"
{
    Properties
    {
        _AlbedoMap ("Albedo(RGBA)", 2D) = "white" {}
        _MainColor ("Main Color(RGBA)", Color) = (0.8, 0.8, 0.8, 1.0)
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _SpecColor ("Specular Color(RGB)", Color) = (1, 1, 1, 1)
        _Shininess ("Shininess", Range(0.0, 1.0)) = 0.5
        _EmissiveMap ("Emissive(RGB)", 2D) = "balck" {}
        _EmissiveColor ("Emissive Color(RGB)", Color) = (0.0, 0.0, 0.0 , 1.0)
        _OcclusionMap ("Occlusion Map(R)", 2D) = "white" {}
        _OcclusionStrength("Occlusion Strength", Range(0, 1)) = 1
        _SpecReflectivity ("Specular Reflectivity", Range(0, 1)) = 0.5
        _AlphaThreshold ("Alpha Cutout Threshold", Range(0, 1)) = 0.1
        _EnvReflectivity ("Reflectivity", Range(0, 1)) = 0.5
        _EnvReflectStrength ("Strength", Range(0, 1)) = 0.5

        [HideInInspector] _SrcBlendFactor ("Src Blend", Float) = 1
        [HideInInspector] _DstBlendFactor ("Dst Blend", Float) = 0
        [HideInInspector] _Zwrite ("Z Write", Float) = 1
        
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" 
                "Queue" = "Geometry"
             }
        LOD 100

        Pass {
            Tags {"LightMode" = "ShadowCaster"}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct VS_IN {
                float4 posL : POSITION;
                float3 normalL : NORMAL;
            };

            struct VS_OUT {
                float4 posC : SV_POSITION;
            };

            VS_OUT vert(VS_IN v) : SV_POSITION {
                VS_OUT o;
                float4 posClip = UnityClipSpaceShadowCasterPos(v.posL.xyz, v.normalL); // normal bias
                o.posC = UnityApplyLinearShadowBias(posClip); // shadow bias
                return o;
            }

            fixed4 frag() : SV_Target {
                return 0;
            }

            ENDCG
        }


        Pass
        {
            Tags { "LightMode" = "ForwardBase" }
            Blend [_SrcBlendFactor] [_DstBlendFactor]
            ZWrite [_Zwrite]

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile _ SHADOWS_SCREEN
            #pragma multi_compile _ VERTEXLIGHT_ON
            
            #pragma shader_feature NORMAL_MAP_ENABLED
            #pragma shader_feature OCCLUSION_MAP_ENABLED
            #pragma shader_feature ENVRONMENT_REFLCTION_ENABLED
            #pragma shader_feature ENVRONMENT_REFLCTION_BOX_PROJECTION_ENABLED
            #pragma multi_compile_fog //FOG_LINEAR FOG_EXP FOG_EXP2
            #pragma shader_feature _ RENDER_MODE_CUTOUT RENDER_MODE_FADE RENDER_MODE_TRANSPARENT

            #if defined(FOG_LINEAR) || defined(FOG_EXP) || defined(FOG_EXP2)
            #define UNITY_FOG 1
            #endif
            
            #include "PhongLighting.cginc"

            sampler2D _AlbedoMap;
            half4 _AlbedoMap_ST;
            fixed4 _MainColor;
            fixed _Shininess;

            sampler2D _NormalMap;

            sampler2D _EmissiveMap;
            fixed4 _EmissiveColor;

            sampler2D _OcclusionMap;
            half _OcclusionStrength;
            
            half _SpecReflectivity;
            half _AlphaThreshold;
            
            half _EnvReflectivity;
            half _EnvReflectStrength;

            VS_OUT vert (VS_IN v)
            {
                VS_OUT o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.normalW = UnityObjectToWorldNormal(v.normal);
                o.tangentW =  float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
                o.posW = mul(unity_ObjectToWorld, v.vertex).xyz;
                o.uv = TRANSFORM_TEX(v.uv, _AlbedoMap);
                TRANSFER_SHADOW(o);
                #ifdef VERTEXLIGHT_ON
                //fixed4 D = tex2D(_AlbedoMap, o.uv) * _MainColor;
                o.vertLightColor = Shade4PointLights(unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
                    unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
                    unity_4LightAtten0, o.posW, o.normalW); //* D.rgb;
                #endif

                #if UNITY_FOG
                o.clipDepth = o.pos.z;
                #endif

                return o;
            }

            half4 frag (VS_OUT fs_in) : SV_Target
            {
                // main directional light
                fixed4 A = tex2D(_AlbedoMap, fs_in.uv) * _MainColor;

                #ifdef RENDER_MODE_CUTOUT
                clip(A.a - _AlphaThreshold);
                #endif

                #ifdef RENDER_MODE_TRANSPARENT //premultiplied alpha blending
                A.rgb *= A.a;
                #endif

                half3 normal = fs_in.normalW;
                #ifdef NORMAL_MAP_ENABLED 
                half3 normalT = UnpackNormal(tex2D(_NormalMap, fs_in.uv));
                half3 biTangentW = normalize(cross(fs_in.normalW, fs_in.tangentW.xyz) * fs_in.tangentW.w * unity_WorldTransformParams.w); // if object has negative scale, flip bitangent
                normal = normalize(normalT.x * fs_in.tangentW.xyz + normalT.y * biTangentW + normalT.z * fs_in.normalW);
                #endif
                
                // direct light
                // diffuse, specular
                half3 directLight = PhongLighting(fs_in, normal, A.rgb, _SpecColor.rgb, _Shininess);

                // emissive
                half3 E = tex2D(_EmissiveMap, fs_in.uv).rgb * _EmissiveColor.rgb;

                // indirect lights (diffuse reflection)
                // 4 vert lit point light
                half3 indirectLight = (0, 0, 0);
                #ifdef VERTEXLIGHT_ON
                    indirectLight += fs_in.vertLightColor * A.rgb; 
                #endif
                
                // Spherical Harmonics 
                indirectLight += saturate(ShadeSH9(half4(fs_in.normalW, 1))); 

                // indirect lights (specular reflection)
                // environment reflection
                #ifdef ENVRONMENT_REFLCTION_ENABLED
                half3 V = UnityWorldSpaceViewDir(fs_in.posW);
                half3 sampleDir = reflect(-V, normal);
                #ifdef ENVRONMENT_REFLCTION_BOX_PROJECTION_ENABLED
                sampleDir = BoxProjection(sampleDir, fs_in.posW, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
                #endif
                half roughness = 1 - _EnvReflectivity;
                half4 R = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, sampleDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                R.rgb = DecodeHDR(R, unity_SpecCube0_HDR);
                indirectLight += R.rgb * _EnvReflectStrength;
                #endif

                #ifdef OCCLUSION_MAP_ENABLED
                half occlusion = lerp(1, tex2D(_OcclusionMap, fs_in.uv).r, _OcclusionStrength);
                indirectLight *= occlusion;
                #endif

                half3 totalLight = directLight + E + indirectLight;
                half alpha = 1;
                #if defined(RENDER_MODE_FADE)
                    alpha = A.a;
                #endif
                #if defined(RENDER_MODE_TRANSPARENT)
                    alpha = saturate(1 - (1-A.a) * (1-_SpecReflectivity));
                #endif

                // apply fog
                #if UNITY_FOG
                totalLight = ApplyFog(totalLight, fs_in.clipDepth);
                #endif
               
                return  half4(totalLight, alpha);
            }
            ENDCG
        }


        Pass  {
            Tags {"LightMode" = "ForwardAdd"}
            Blend [_SrcBlendFactor] One
            ZWrite Off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdadd
            #pragma multi_compile _ SHADOWS_SCREEN
            #pragma multi_compile_fog
            #pragma shader_feature _ NORMAL_MAP_ENABLED
            #pragma shader_feature _ RENDER_MODE_CUTOUT RENDER_MODE_FADE RENDER_MODE_TRANSPARENT 

            #if defined(FOG_LINEAR) || defined(FOG_EXP) || defined(FOG_EXP2)
            #define UNITY_FOG 1
            #endif
            
            #include "PhongLighting.cginc"
            
            sampler2D _AlbedoMap;
            sampler2D _NormalMap;
            half4 _AlbedoMap_ST;
            fixed4 _MainColor;
            half _Shininess;
            half _AlphaThreshold;
            half _SpecReflectivity;

            VS_OUT vert (VS_IN v)
            {
                VS_OUT o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.normalW = UnityObjectToWorldNormal(v.normal);
                o.tangentW =  float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
                o.posW = mul(unity_ObjectToWorld, v.vertex).xyz;
                o.uv = TRANSFORM_TEX(v.uv, _AlbedoMap);
                TRANSFER_SHADOW(o);
                #if UNITY_FOG
                o.clipDepth = o.pos.z;
                #endif
                return o;
            }

            half4 frag (VS_OUT fs_in) : SV_Target
            {   
                half4 A = tex2D(_AlbedoMap, fs_in.uv) * _MainColor;
                
                #ifdef RENDER_MODE_CUTOUT
                clip(A.a - _AlphaThreshold);
                #endif

                #ifdef RENDER_MODE_TRANSPARENT 
                A.rgb *= A.a;
                #endif

                half3 normal = fs_in.normalW;
                #ifdef NORMAL_MAP_ENABLED
                half3 normalT = UnpackNormal(tex2D(_NormalMap, fs_in.uv));
                half3 biTangentW = normalize(cross(fs_in.normalW, fs_in.tangentW.xyz) * fs_in.tangentW.w * unity_WorldTransformParams.w); // if object has negative scale, flip bitangent
                normal = normalize(normalT.x * fs_in.tangentW.xyz + normalT.y * biTangentW + normalT.z * fs_in.normalW);
                #endif

                half3 C = PhongLighting(fs_in, normal, A.rgb, _SpecColor, _Shininess);
                half alpha = 1;
                #if defined(RENDER_MODE_FADE) 
                    alpha = A.a;
                #endif
                #if defined(RENDER_MODE_TRANSPARENT)
                    alpha = saturate(1 - (1-A.a) * (1-_SpecReflectivity));
                #endif

                // apply fog
                #if UNITY_FOG
                C = ApplyFog(C, fs_in.clipDepth);
                #endif

                return half4(C, alpha);
            }


            ENDCG
        }

        Pass {
            Tags {
                "LightMode" = "Deferred"
            }

            CGPROGRAM
            #pragma multi_compile _ VERTEXLIGHT_ON
            #pragma multi_compile _ UNITY_HDR_ON
            #pragma shader_feature _ RENDER_MODE_CUTOUT
            #pragma shader_feature NORMAL_MAP_ENABLED
            #pragma shader_feature OCCLUSION_MAP_ENABLED
            #pragma shader_feature ENVRONMENT_REFLCTION_ENABLED
            #pragma shader_feature ENVRONMENT_REFLCTION_BOX_PROJECTION_ENABLED
            
            #pragma vertex vert
            #pragma fragment frag

            #include "PhongLighting.cginc"

            sampler2D _AlbedoMap;
            half4 _AlbedoMap_ST;
            fixed4 _MainColor;

            half _AlphaThreshold;
            half _Shininess;
            half _EnvReflectivity;
            half _EnvReflectStrength;

            sampler2D _NormalMap;

            sampler2D _EmissiveMap;
            fixed4 _EmissiveColor;

            sampler2D _OcclusionMap;
            half _OcclusionStrength;

            struct FS_OUT {
                float4 gBuffer0 : SV_Target0;
                float4 gBuffer1 : SV_Target1;
                float4 gBuffer2 : SV_Target2;
                float4 gBuffer3 : SV_Target3;
            };

            VS_OUT vert( VS_IN v) {
                VS_OUT vsOut;
                vsOut.pos = UnityObjectToClipPos(v.vertex);
                vsOut.normalW = UnityObjectToWorldNormal(v.normal);
                vsOut.tangentW =  float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
                vsOut.posW = mul(unity_ObjectToWorld, v.vertex).xyz;
                vsOut.uv = TRANSFORM_TEX(v.uv, _AlbedoMap);
                #ifdef VERTEXLIGHT_ON
                vsOut.vertLightColor = Shade4PointLights(unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
                    unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
                    unity_4LightAtten0, vsOut.posW, vsOut.normalW); //* D.rgb;
                #endif
                
                return vsOut;
            }

            FS_OUT frag(VS_OUT fsIn) {
                FS_OUT fsOut;
                // albedo & occlusion
                fixed4 A = tex2D(_AlbedoMap, fsIn.uv) * _MainColor;
                #ifdef RENDER_MODE_CUTOUT
                clip(A.a - _AlphaThreshold);
                #endif
                half occlusion = 1;
                #ifdef OCCLUSION_MAP_ENABLED
                occlusion = lerp(1,tex2D(_OcclusionMap, fsIn.uv).r, _OcclusionStrength); 
                #endif

                fsOut.gBuffer0.rgb = A.rgb;
                fsOut.gBuffer0.a = occlusion;

                // specular & smoothness
                fsOut.gBuffer1.rgb = _SpecColor.rgb; //gBuffer1.rgb = lerp(F0, tex2D(_AlbedoMap).rgb, _metallic);
                fsOut.gBuffer1.a = _Shininess;

                // world space normal
                half3 normal = fsIn.normalW;
                #ifdef NORMAL_MAP_ENABLED
                half3 normalT = UnpackNormal(tex2D(_NormalMap, fsIn.uv));
                half3 biTangentW = normalize(cross(fsIn.normalW, fsIn.tangentW.xyz) * fsIn.tangentW.w * unity_WorldTransformParams.w); // if object has negative scale, flip bitangent
                normal = normalize(normalT.x * fsIn.tangentW.xyz + normalT.y * biTangentW + normalT.z * fsIn.normalW);
                #endif
                fsOut.gBuffer2.rgb = normal * 0.5 + 0.5;
                fsOut.gBuffer2.a = 0;

                // emissive
                half3 E = tex2D(_EmissiveMap, fsIn.uv).rgb * _EmissiveColor.rgb;
                
                // Light accumulation (Emission, Ambient, environment reflection...)
                half3 C = (0,0,0);
                #ifdef VERTEXLIGHT_ON
                    C += fsIn.vertLightColor * A.rgb;
                #endif
                C += saturate(ShadeSH9(half4(fsIn.normalW, 1)));

                #ifdef ENVRONMENT_REFLCTION_ENABLED
                half3 V = UnityWorldSpaceViewDir(fsIn.posW);
                half3 sampleDir = reflect(-V, normal);
                #ifdef ENVRONMENT_REFLCTION_BOX_PROJECTION_ENABLED
                sampleDir = BoxProjection(sampleDir, fsIn.posW, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
                #endif
                half roughness = 1 - _EnvReflectivity;
                half4 R = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, sampleDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                R.rgb = DecodeHDR(R, unity_SpecCube0_HDR);
                C += R.rgb * _EnvReflectStrength;
                #endif

                C *= occlusion;
                C += E;

                #if !defined(UNITY_HDR_ON)
                C = exp2(-C);
                #endif

                fsOut.gBuffer3.rgb = C;
                fsOut.gBuffer3.a = 1;

                return fsOut;
            }


            ENDCG
        }
    }

    CustomEditor "PhongLigtingShaderGUI"
}
