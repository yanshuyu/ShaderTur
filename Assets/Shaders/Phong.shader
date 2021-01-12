Shader "Custom/Phong"
{
    Properties
    {
        _AlbedoMap ("Albedo", 2D) = "white" {}
        _MainColor ("Main Color", Color) = (0.8, 0.8, 0.8, 1.0)
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _SpecColor ("Specular Color", Color) = (1, 1, 1, 1)
        _Shininess ("Shininess", Range(0.0, 1.0)) = 0.5
        _EmissiveMap ("Emissive", 2D) = "balck" {}
        _EmissiveColor ("Emissive Color", Color) = (0.0, 0.0, 0.0 , 1.0)
        _Reflectivity ("Environement Reflectivity", Range(0, 1)) = 0
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

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile _ SHADOWS_SCREEN
            #pragma multi_compile _ VERTEXLIGHT_ON

            #define UNITY_SPECCUBE_LOD_STEPS 6

            #include "PhongLighting.cginc"

            sampler2D _AlbedoMap;
            half4 _AlbedoMap_ST;
            fixed4 _MainColor;
            fixed _Shininess;

            sampler2D _NormalMap;

            sampler2D _EmissiveMap;
            fixed4 _EmissiveColor;
            
            half _Reflectivity;

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

                return o;
            }

            fixed4 frag (VS_OUT fs_in) : SV_Target
            {
                half3 normalT = UnpackNormal(tex2D(_NormalMap, fs_in.uv));
                half3 biTangentW = normalize(cross(fs_in.normalW, fs_in.tangentW.xyz) * fs_in.tangentW.w * unity_WorldTransformParams.w); // if object has negative scale, flip bitangent
                half3 normal = normalize(normalT.x * fs_in.tangentW.xyz + normalT.y * biTangentW + normalT.z * fs_in.normalW);
                
                // main directional light
                fixed4 A = tex2D(_AlbedoMap, fs_in.uv) * _MainColor;
                // diffuse, specular
                half3 C = PhongLighting(fs_in, normal, A.rgb, _SpecColor.rgb, _Shininess);

                // emissive
                half3 E = tex2D(_EmissiveMap, fs_in.uv).rgb * _EmissiveColor.rgb;
                half3 finalColor = C + E; 

                // 4 vert lit point light
                #ifdef VERTEXLIGHT_ON
                    finalColor += fs_in.vertLightColor * A.rgb; 
                #endif
                
                // Spherical Harmonics 
                finalColor += saturate(ShadeSH9(half4(fs_in.normalW, 1))); 

                // environment reflection
                half3 V = UnityWorldSpaceViewDir(fs_in.posW);
                half3 sampleDir = reflect(-V, normal);
                half roughness = 1 - _Reflectivity;
                half3 R = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, sampleDir, roughness * UNITY_SPECCUBE_LOD_STEPS).rgb;
                finalColor += R;

                return  fixed4(finalColor, A.a);
            }
            ENDCG
        }


        Pass 
        {
                Tags {"LightMode" = "ForwardAdd"}
                Blend One One
                ZWrite False

                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #pragma multi_compile_fwdadd
                #pragma multi_compile _ SHADOWS_SCREEN

                #include "PhongLighting.cginc"
                
                sampler2D _AlbedoMap;
                sampler2D _NormalMap;
                float4 _AlbedoMap_ST;
                float4 _MainColor;
                float _Shininess;




                VS_OUT vert (VS_IN v)
                {
                    VS_OUT o;
                    o.pos = UnityObjectToClipPos(v.vertex);
                    o.normalW = UnityObjectToWorldNormal(v.normal);
                    o.tangentW =  float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
                    o.posW = mul(unity_ObjectToWorld, v.vertex).xyz;
                    o.uv = TRANSFORM_TEX(v.uv, _AlbedoMap);
                    TRANSFER_SHADOW(o);
                    return o;
                }

                fixed4 frag (VS_OUT fs_in) : SV_Target
                {
                    half3 normalT = UnpackNormal(tex2D(_NormalMap, fs_in.uv));
                    half3 biTangentW = normalize(cross(fs_in.normalW, fs_in.tangentW.xyz) * fs_in.tangentW.w * unity_WorldTransformParams.w); // if object has negative scale, flip bitangent
                    half3 normal = normalize(normalT.x * fs_in.tangentW.xyz + normalT.y * biTangentW + normalT.z * fs_in.normalW);
                    half4 A = tex2D(_AlbedoMap, fs_in.uv) * _MainColor;
                    half3 C = PhongLighting(fs_in, normal, A.rgb, _SpecColor, _Shininess);
                    return fixed4(C, A.a);
                }


                ENDCG
        }

    }
}
