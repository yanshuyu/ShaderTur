Shader "Custom/Phong"
{
    Properties
    {
        _MainTex ("Albedo(RGBA)", 2D) = "white" {}
        _Color ("Main Color(RGBA)", Color) = (0.8, 0.8, 0.8, 1.0)
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _SpecColor ("Specular Color(RGB)", Color) = (1, 1, 1, 1)
        _Shininess ("Shininess", Range(0.0, 1.0)) = 0.5
        _EmissiveMap ("Emissive(RGB)", 2D) = "white" {}
        _EmissiveColor ("Emissive Color(RGB)", Color) = (0.0, 0.0, 0.0 , 1.0)
        _OcclusionMap ("Occlusion Map(R)", 2D) = "white" {}
        _OcclusionStrength("Occlusion Strength", Range(0, 1)) = 1
        _SpecReflectivity ("Specular Reflectivity", Range(0, 1)) = 0.5
        _Cutoff ("Alpha Cutout Threshold", Range(0, 1)) = 0.1
        _EnvReflectivity ("Reflectivity", Range(0, 1)) = 0.5
        _EnvReflectStrength ("Strength", Range(0, 1)) = 0.5
        _EdgeColor ("Edge Color", Color) = (0, 0, 0, 1)
        _EdgeWidth ("Edge Width", Range(1, 20)) = 0.05

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
            #pragma shader_feature _ RENDER_MODE_CUTOUT RENDER_MODE_FADE RENDER_MODE_TRANSPARENT
            #include "UnityCG.cginc"

            #if defined(RENDER_MODE_FADE) || defined(RENDER_MODE_TRANSPARENT)
            #define SEMITETRANSPARENT_SHADOW
            #endif

            #if defined(RENDER_MODE_CUTOUT) || defined(SEMITETRANSPARENT_SHADOW)
            #define SHADOW_NEED_UV
            #endif

            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _Color;
            half _Cutoff;

            sampler3D _DitherMaskLOD;

            struct VS_IN {
                float4 posL : POSITION;
                float3 normalL : NORMAL;
                float2 uv : TEXCOORD0;
            };

            struct VS_OUT {
                float4 posC : SV_POSITION;
                float2 uv : TEXCOORD0;
                
                #ifdef SHADOW_CUBE
                float3 lightVec : TEXCOORD1;
                #endif

                #ifdef SEMITETRANSPARENT_SHADOW
                float4 screenPos : TEXCOORD2; //light space screen pos
                #endif

            };

            VS_OUT vert(VS_IN v) {
                VS_OUT o;
                o.uv = v.uv;
                #ifdef SHADOW_CUBE
                o.posC = UnityObjectToClipPos(v.posL);
                o.lightVec = mul(unity_ObjectToWorld, v.posL).xyz - _WorldSpaceLightPos0.xyz;
                #else
                float4 posClip = UnityClipSpaceShadowCasterPos(v.posL.xyz, v.normalL); // normal bias
                o.posC = UnityApplyLinearShadowBias(posClip); // shadow bias
                #endif
               
                #ifdef SHADOW_NEED_UV
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                #endif

                #ifdef SEMITETRANSPARENT_SHADOW
                o.screenPos = ComputeScreenPos(UnityObjectToClipPos(v.posL));
                #endif

                return o;
            }

            fixed4 frag(VS_OUT fs_in) : SV_Target {
                #ifdef RENDER_MODE_CUTOUT
                float a = tex2D(_MainTex, fs_in.uv).a * _Color.a;
                clip(a - _Cutoff);
                #endif

                #ifdef SEMITETRANSPARENT_SHADOW
                float a = tex2D(_MainTex, fs_in.uv).a * _Color.a;
                a = tex3D(_DitherMaskLOD, float3(10000 * (fs_in.screenPos.xy / fs_in.screenPos.w) , a * 15 / 16.0)).a;
                clip(a - 0.01);
                #endif
                
                #ifdef SHADOW_CUBE
                float depth = length(fs_in.lightVec) + unity_LightShadowBias.x;;
                depth *= _LightPositionRange.w; // 1/range
                return UnityEncodeCubeShadowDepth(depth);
                #endif

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
            #pragma geometry geom
            #pragma fragment frag
            #pragma target 4.0

            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog //FOG_LINEAR FOG_EXP FOG_EXP2
            #pragma shader_feature NORMAL_MAP_ENABLED
            #pragma shader_feature OCCLUSION_MAP_ENABLED
            #pragma shader_feature ENVRONMENT_REFLCTION_ENABLED
            #pragma shader_feature ENVRONMENT_REFLCTION_BOX_PROJECTION_ENABLED
            #pragma shader_feature _ RENDER_MODE_CUTOUT RENDER_MODE_FADE RENDER_MODE_TRANSPARENT
            #pragma shader_feature _ SHADE_MODE_FLAT SHADE_MODE_WIREFRAME

            #if defined(FOG_LINEAR) || defined(FOG_EXP) || defined(FOG_EXP2)
            #define UNITY_FOG 1
            #endif
            
            #include "PhongLighting.cginc"

            sampler2D _MainTex;
            half4 _MainTex_ST;
            fixed4 _Color;
            fixed _Shininess;

            sampler2D _NormalMap;

            sampler2D _EmissiveMap;
            fixed4 _EmissiveColor;

            sampler2D _OcclusionMap;
            half _OcclusionStrength;
            
            half _SpecReflectivity;
            half _Cutoff;
            
            half _EnvReflectivity;
            half _EnvReflectStrength;

            fixed4 _EdgeColor;
            half _EdgeWidth;

            VS_OUT vert (VS_IN v)
            {
                VS_OUT o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.normalW = UnityObjectToWorldNormal(v.normal);
                o.tangentW =  float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
                o.posW = mul(unity_ObjectToWorld, v.vertex).xyz;
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                #ifdef LIGHTMAP_ON
                o.uv_LightMap = v.uv1 * unity_LightmapST.xy + unity_LightmapST.zw; // can't transform by TRANSFORM_TEX case unity_LightmapST is not defined as unity_Lightmap_ST
                #endif
                #ifdef VERTEXLIGHT_ON
                //fixed4 D = tex2D(_MainTex, o.uv) * _Color;
                o.vertLightColor = Shade4PointLights(unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
                    unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
                    unity_4LightAtten0, o.posW, o.normalW); //* D.rgb;
                #endif

                TRANSFER_SHADOW(o);

                #if UNITY_FOG
                o.clipDepth = o.pos.z;
                #endif

                #ifdef SHADE_MODE_WIREFRAME
                o.edgeDistance = (0, 0, 0);
                #endif

                return o;
            }

            [maxvertexcount(3)]
            void geom(triangle VS_OUT gs_in[3], inout TriangleStream<VS_OUT> triStream)
            {
                #ifdef SHADE_MODE_FLAT
                float3 v0 = gs_in[1].posW - gs_in[0].posW;
                float3 v1 = gs_in[2].posW - gs_in[0].posW;
                gs_in[0].normalW = gs_in[1].normalW = gs_in[2].normalW = normalize(cross(v0, v1));
                #endif

                #ifdef SHADE_MODE_WIREFRAME
                float4 p0 = ComputeScreenPos(gs_in[0].pos);
                float4 p1 = ComputeScreenPos(gs_in[1].pos);
                float4 p2 = ComputeScreenPos(gs_in[2].pos);
                p0.xy =  p0.xy / p0.w * _ScreenParams.xy;
                p1.xy =  p1.xy / p1.w * _ScreenParams.xy;
                p2.xy =  p2.xy / p2.w * _ScreenParams.xy;

                float a = length(p1.xy - p2.xy);
                float b = length(p2.xy - p0.xy);
                float c = length(p1.xy - p0.xy);

                float alpha = acos( (b*b + c*c - a*a) / (2.0*b*c) );
                float beta = acos( (a*a + c*c - b*b) / (2.0*a*c) );
                float ha = abs( c * sin( beta ) );
                float hb = abs( c * sin( alpha ) );
                float hc = abs( b * sin( alpha ) );
  
                gs_in[0].edgeDistance = (ha, 0, 0);
                gs_in[1].edgeDistance = (0, hb, 0);
                gs_in[2].edgeDistance = (0, 0, hc);
                #endif

                triStream.Append(gs_in[0]);
                triStream.Append(gs_in[1]);
                triStream.Append(gs_in[2]);
            }

            half4 frag (VS_OUT fs_in) : SV_Target
            {
                // main directional light
                fixed4 A = tex2D(_MainTex, fs_in.uv) * _Color;

                #ifdef RENDER_MODE_CUTOUT
                clip(A.a - _Cutoff);
                #endif

                #ifdef RENDER_MODE_TRANSPARENT //premultiplied alpha blending
                A.rgb *= A.a;
                #endif

                half3 normal = fs_in.normalW;
                #if defined(NORMAL_MAP_ENABLED) && !defined(SHADE_MODE_FLAT) 
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
                #if !defined(LIGHTMAP_ON)
                #ifdef VERTEXLIGHT_ON
                    indirectLight += fs_in.vertLightColor * A.rgb; 
                #endif
                // Spherical Harmonics 
                indirectLight += saturate(ShadeSH9(half4(fs_in.normalW, 1))); 
                #else
                indirectLight = DecodeLightmap(UNITY_SAMPLE_TEX2D(unity_Lightmap, fs_in.uv_LightMap)); //UNITY_DECLARE_TEX2D(unity_Lightmap)
                #endif
                
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

                #ifdef SHADE_MODE_WIREFRAME
                float minEdgeDis = min(min(fs_in.edgeDistance.x, fs_in.edgeDistance.y), fs_in.edgeDistance.z);
                minEdgeDis = smoothstep(_EdgeWidth/2 - 1, _EdgeWidth/2 + 1, minEdgeDis);    
                totalLight.rgb = lerp(_EdgeColor.rgb, totalLight.rgb, minEdgeDis);
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
            #pragma geometry geom
            #pragma fragment frag
            #pragma target 4.0

            #pragma multi_compile_fwdadd
            #pragma multi_compile _ SHADOWS_SCREEN
            #pragma multi_compile_fog
            #pragma shader_feature _ NORMAL_MAP_ENABLED
            #pragma shader_feature _ RENDER_MODE_CUTOUT RENDER_MODE_FADE RENDER_MODE_TRANSPARENT 
            #pragma shader_feature _ SHADE_MODE_FLAT
            #if defined(FOG_LINEAR) || defined(FOG_EXP) || defined(FOG_EXP2)
            #define UNITY_FOG 1
            #endif
            
            #include "PhongLighting.cginc"
            
            sampler2D _MainTex;
            sampler2D _NormalMap;
            half4 _MainTex_ST;
            fixed4 _Color;
            half _Shininess;
            half _Cutoff;
            half _SpecReflectivity;


            VS_OUT vert (VS_IN v)
            {
                VS_OUT o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.normalW = UnityObjectToWorldNormal(v.normal);
                o.tangentW =  float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
                o.posW = mul(unity_ObjectToWorld, v.vertex).xyz;
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);

                TRANSFER_SHADOW(o);

                #if UNITY_FOG
                o.clipDepth = o.pos.z;
                #endif

                #ifdef SHADE_MODE_WIREFRAME
                o.edgeDistance = (0, 0, 0);
                #endif

                return o;
            }


            [maxvertexcount(3)]
            void geom(triangle VS_OUT gs_in[3], inout TriangleStream<VS_OUT> triStream)
            {
                #ifdef SHADE_MODE_FLAT
                float3 v0 = gs_in[1].posW - gs_in[0].posW;
                float3 v1 = gs_in[2].posW - gs_in[0].posW;
                gs_in[0].normalW = gs_in[1].normalW = gs_in[2].normalW = normalize(cross(v0, v1));
                #endif

                triStream.Append(gs_in[0]);
                triStream.Append(gs_in[1]);
                triStream.Append(gs_in[2]);
            }

            half4 frag (VS_OUT fs_in) : SV_Target
            {   
                half4 A = tex2D(_MainTex, fs_in.uv) * _Color;
                
                #ifdef RENDER_MODE_CUTOUT
                clip(A.a - _Cutoff);
                #endif

                #ifdef RENDER_MODE_TRANSPARENT 
                A.rgb *= A.a;
                #endif

                half3 normal = fs_in.normalW;
                #if defined(NORMAL_MAP_ENABLED) && !defined(SHADE_MODE_FLAT)
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
            #pragma shader_feature _ SHADE_MODE_FLAT SHADE_MODE_WIREFRAME
            
            #pragma vertex vert
            #pragma geometry geom
            #pragma fragment frag
            #pragma target 4.0

            #include "PhongLighting.cginc"

            sampler2D _MainTex;
            half4 _MainTex_ST;
            fixed4 _Color;

            half _Cutoff;
            half _Shininess;
            half _EnvReflectivity;
            half _EnvReflectStrength;

            sampler2D _NormalMap;

            sampler2D _EmissiveMap;
            fixed4 _EmissiveColor;

            sampler2D _OcclusionMap;
            half _OcclusionStrength;

            fixed4 _EdgeColor;
            half _EdgeWidth;

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
                vsOut.uv = TRANSFORM_TEX(v.uv, _MainTex);
                #ifdef VERTEXLIGHT_ON
                vsOut.vertLightColor = Shade4PointLights(unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
                    unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
                    unity_4LightAtten0, vsOut.posW, vsOut.normalW); //* D.rgb;
                #endif

                #ifdef SHADE_MODE_WIREFRAME
                vsOut.edgeDistance = (0, 0, 0);
                #endif
                
                return vsOut;
            }

            [maxvertexcount(3)]
            void geom(triangle VS_OUT gs_in[3], inout TriangleStream<VS_OUT> triStream)
            {
                #ifdef SHADE_MODE_FLAT
                float3 v0 = gs_in[1].posW - gs_in[0].posW;
                float3 v1 = gs_in[2].posW - gs_in[0].posW;
                gs_in[0].normalW = gs_in[1].normalW = gs_in[2].normalW = normalize(cross(v0, v1));
                #endif

                #ifdef SHADE_MODE_WIREFRAME
                float4 p0 = ComputeScreenPos(gs_in[0].pos);
                float4 p1 = ComputeScreenPos(gs_in[1].pos);
                float4 p2 = ComputeScreenPos(gs_in[2].pos);
                p0.xy =  p0.xy / p0.w * _ScreenParams.xy;
                p1.xy =  p1.xy / p1.w * _ScreenParams.xy;
                p2.xy =  p2.xy / p2.w * _ScreenParams.xy;

                float a = length(p1.xy - p2.xy);
                float b = length(p2.xy - p0.xy);
                float c = length(p1.xy - p0.xy);

                float alpha = acos( (b*b + c*c - a*a) / (2.0*b*c) );
                float beta = acos( (a*a + c*c - b*b) / (2.0*a*c) );
                float ha = abs( c * sin( beta ) );
                float hb = abs( c * sin( alpha ) );
                float hc = abs( b * sin( alpha ) );
  
                gs_in[0].edgeDistance = (ha, 0, 0);
                gs_in[1].edgeDistance = (0, hb, 0);
                gs_in[2].edgeDistance = (0, 0, hc);
                #endif

                triStream.Append(gs_in[0]);
                triStream.Append(gs_in[1]);
                triStream.Append(gs_in[2]);
            }

            FS_OUT frag(VS_OUT fs_in) {
                FS_OUT fsOut;
                // albedo & occlusion
                fixed4 A = tex2D(_MainTex, fs_in.uv) * _Color;
                #ifdef RENDER_MODE_CUTOUT
                clip(A.a - _Cutoff);
                #endif
                half occlusion = 1;
                #ifdef OCCLUSION_MAP_ENABLED
                occlusion = lerp(1,tex2D(_OcclusionMap, fs_in.uv).r, _OcclusionStrength); 
                #endif

                fsOut.gBuffer0.rgb = A.rgb;
                fsOut.gBuffer0.a = occlusion;

                // specular & smoothness
                fsOut.gBuffer1.rgb = _SpecColor.rgb; //gBuffer1.rgb = lerp(F0, tex2D(_MainTex).rgb, _metallic);
                fsOut.gBuffer1.a = _Shininess;

                // world space normal
                half3 normal = fs_in.normalW;
                #if defined(NORMAL_MAP_ENABLED) && !defined(SHADE_MODE_FLAT)
                half3 normalT = UnpackNormal(tex2D(_NormalMap, fs_in.uv));
                half3 biTangentW = normalize(cross(fs_in.normalW, fs_in.tangentW.xyz) * fs_in.tangentW.w * unity_WorldTransformParams.w); // if object has negative scale, flip bitangent
                normal = normalize(normalT.x * fs_in.tangentW.xyz + normalT.y * biTangentW + normalT.z * fs_in.normalW);
                #endif
                fsOut.gBuffer2.rgb = normal * 0.5 + 0.5;
                fsOut.gBuffer2.a = 0;

                // emissive
                half3 E = tex2D(_EmissiveMap, fs_in.uv).rgb * _EmissiveColor.rgb;
                
                // Light accumulation (Emission, Ambient, environment reflection...)
                half3 C = (0,0,0);
                #ifdef VERTEXLIGHT_ON
                    C += fs_in.vertLightColor * A.rgb;
                #endif
                C += saturate(ShadeSH9(half4(fs_in.normalW, 1)));

                #ifdef ENVRONMENT_REFLCTION_ENABLED
                half3 V = UnityWorldSpaceViewDir(fs_in.posW);
                half3 sampleDir = reflect(-V, normal);
                #ifdef ENVRONMENT_REFLCTION_BOX_PROJECTION_ENABLED
                sampleDir = BoxProjection(sampleDir, fs_in.posW, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
                #endif
                half roughness = 1 - _EnvReflectivity;
                half4 R = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, sampleDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                R.rgb = DecodeHDR(R, unity_SpecCube0_HDR);
                C += R.rgb * _EnvReflectStrength;
                #endif

                C *= occlusion;
                C += E;

                #ifdef SHADE_MODE_WIREFRAME
                float minEdgeDis = min(min(fs_in.edgeDistance.x, fs_in.edgeDistance.y), fs_in.edgeDistance.z);
                minEdgeDis = smoothstep(_EdgeWidth/2 - 1, _EdgeWidth/2 + 1, minEdgeDis);    
                C.rgb = lerp(_EdgeColor.rgb, C.rgb, minEdgeDis);
                #endif

                #if !defined(UNITY_HDR_ON)
                C = exp2(-C);
                #endif

                fsOut.gBuffer3.rgb = C;
                fsOut.gBuffer3.a = 1;

                return fsOut;
            }


            ENDCG
        }

        pass {
            Tags { "LightMode" = "Meta" }
            Cull Off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            #include "UnityMetaPass.cginc"

            sampler2D _MainTex;
            sampler2D _EmissiveMap;
            float4 _MainTex_ST;
            fixed _Color;
            fixed4 _EmissiveColor;
            
            struct appdata {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
            };

            struct v2f {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vert(appdata v) {
                v2f o;
                v.vertex.xy = v.uv1 * unity_LightmapST.xy + unity_LightmapST.zw; //transform to lightMap space
                v.vertex.z = v.vertex.z > 0 ? 0.001 : 0;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            float4 frag(v2f i): SV_Target { // perform pass twice to output albedo and emission
                UnityMetaInput mi;
                mi.Albedo = tex2D(_MainTex, i.uv) * _Color;
                mi.Emission = tex2D(_EmissiveMap, i.uv) * _EmissiveColor;
                return UnityMetaFragment(mi);
            }

            ENDCG
        }
    }

    CustomEditor "PhongLigtingShaderGUI"
}
