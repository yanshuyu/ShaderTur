Shader "Custom/BrightnessSaturationContrast"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Brightness ("Brightness", Range(0, 2)) = 1
        _Saturation ("Saturation", Range(0, 1)) = 1
        _Contrast ("Contrast", Range(0, 1)) = 1
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

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
            half _Brightness;
            half _Saturation;
            half _Contrast;

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                        
                half3 brColor = col.rgb * _Brightness;
                half3 lumColor = dot(brColor, half3(0.3086, 0.6094, 0.0820));
                half3 satColor = lerp(lumColor, brColor, _Saturation);
                half3 conColor = lerp(half3(0.5, 0.5, 0.5), satColor, _Contrast);

                return fixed4(conColor, 1);
            }
            ENDCG
        }
    }
}
