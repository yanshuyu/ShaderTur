Shader "Custom/DeferredFog"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }

    SubShader
    {
        // No culling or depth
        Cull Off
        ZWrite Off 
        ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma multi_compile_fog
            #pragma vertex vert
            #pragma fragment frag

            #if defined(FOG_LINEAR) || defined(FOG_EXP) || defined(FOG_EXP2)
            #define UNITY_FOG 1
            #endif

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;
            sampler2D _CameraDepthTexture;

            half4 frag (v2f i) : SV_Target
            {
                half4 col = tex2D(_MainTex, i.uv);
                // just invert the colors
                #ifdef UNITY_FOG
                float depth = SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, i.uv);
                depth = Linear01Depth(depth); // Z buffer to linear 0..1 depth
                float distance = depth * _ProjectionParams.z - _ProjectionParams.y; // multiply by far plane distance, substract near plane distance, convert to view space distance
                UNITY_CALC_FOG_FACTOR_RAW(distance);
                unityFogFactor = saturate(unityFogFactor);
                if (depth > 0.9999) {
                    unityFogFactor = 1;
                }
                col.rgb = lerp(unity_FogColor.rgb, col.rgb, unityFogFactor);
                #endif
      
                return col;
            }
            ENDCG
        }
    }
}
