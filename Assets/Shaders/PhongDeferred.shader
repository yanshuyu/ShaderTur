Shader "Custom/PhongDeferred"
{

    SubShader
    {
        Cull Off
        ZWrite Off
        ZTest Always

        Pass
        {
            Blend One One
            //Blend DstColor Zero // LDR Mode
            
            CGPROGRAM
            #pragma exclude_renderers nomrt
            #pragma multi_compile_lightpass
            #pragma multi_compile _ UNITY_HDR_ON
            #pragma multi_compile _ SHADOWS_SCREEN
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"

            sampler2D _CameraDepthTexture;
            sampler2D _CameraGBufferTexture0;
            sampler2D _CameraGBufferTexture1;
            sampler2D _CameraGBufferTexture2;
            #if defined(POINT)
            sampler2D _LightTextureB0;
            #endif

            float _LightAsQuad;
            float4 _LightDir;
            float4 _LightPos;
            float4 _LightColor;

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 uv : TEXCOORD0;
                float3 ray : TEXCOORD1;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = ComputeScreenPos(o.vertex);
                o.ray = lerp(UnityObjectToViewPos(v.vertex) * float3(-1, -1, 1), v.normal, _LightAsQuad);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv.xy / i.uv.w;
                // compute world space pos
                float depth = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv);
                depth = Linear01Depth(depth);
                float3 ray2FarPlane = i.ray * _ProjectionParams.z / i.ray.z;
                float3 posV = ray2FarPlane * depth;
                float3 posW = mul(unity_CameraToWorld, float4(posV, 1)).xyz;

                // G-buffers
                float4 diffuse_occlusion = tex2D(_CameraGBufferTexture0, uv);
                float4 spec_shininess = tex2D(_CameraGBufferTexture1, uv);
                float3 N = tex2D(_CameraGBufferTexture2, uv).xyz;
                N = N * 2 - 1;

                half lightAtten = 1;
                half3 L = _LightDir.xyz;
                #if defined(DIRECTIONAL) || defined(DIRECTIONAL_COOKIE)
                L = normalize(-L);         
                #ifdef SHADOWS_SCREEN               
                lightAtten *= tex2D(_ShadowMapTexture, uv);
                #endif
                #endif

                #if defined(SPOT) || defined(POINT)
                half3 l = _LightPos.xyz - posW;
                L = normalize(l);
                lightAtten *= tex2D(_LightTextureB0, (dot(l, l) * _LightPos.w).rr).UNITY_ATTEN_CHANNEL; //distance atten
                #if defined(SHADOWS_DEPTH)
                lightAtten *= UnitySampleShadowmap(mul(unity_WorldToShadow[0], float4(posW, 1))); // soft && hard shadow
                #endif
                #if defined(SHADOWS_CUBE)
                lightAtten *= UnitySampleShadowmap(-l);
                #endif
                #endif

                #if defined(SHADOWS_SCREEN) || defined(SHADOWS_DEPTH) || defined(SHADOWS_CUBE)
                float shadowFadeDistance = UnityComputeShadowFadeDistance(posW, posV.z);
                float shadowFade = UnityComputeShadowFade(shadowFadeDistance);
                lightAtten = saturate(lightAtten + shadowFade);
                #endif

                #if defined(SPOT) || defined(DIRECTIONAL_COOKIE) || defined(POINT_COOKIE)
                float4 uv_cookie = mul(unity_WorldToLight, float4(posW, 1));
                #if defined(POINT_COOKIE)
                lightAtten *= texCUBE(_LightTexture0, uv_cookie.xyz).w;
                #else
                lightAtten *= tex2Dproj(_LightTexture0, uv_cookie).w;
                #endif
                //lightAtten *= uv_cookie.w < 0;
                #endif

                half3 V = normalize(_WorldSpaceCameraPos - posW);
                half3 H = normalize(L + V);
                half NdotL = saturate(dot(N, L));
                half NdotH = saturate(dot(N, H));

                half3 I = _LightColor.rgb * lightAtten * NdotL;
                half3 Refr = I * diffuse_occlusion.rgb;
                half3 Refl = I * spec_shininess.rgb * pow(NdotH, spec_shininess.a * 256);
                half3 Col = Refr + Refl;

                #if !defined(UNITY_HDR_ON)
                Col.rgb = exp2(-Col.rgb);
                #endif

                return fixed4(Col, 1);
            }
            ENDCG
        }

        Pass // when render in LDR mode, light data is logarithmically encoded, A final pass is needed to reverse this encoding.
        {
			Stencil {
				Ref [_StencilNonBackground]
				ReadMask [_StencilNonBackground]
				CompBack Equal
				CompFront Equal
			}

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
           
            #include "UnityCG.cginc"

            sampler2D _LightBuffer;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return -log2(tex2D(_LightBuffer, i.uv));
            }
            ENDCG
        }
        
    }
}