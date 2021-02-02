Shader "Custom/Bloom"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always
        
        CGINCLUDE
        
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
        float2 _MainTex_TexelSize;

        half4 BoxSampling(float2 uv, float detal) {
            half3 pixelLB = tex2D(_MainTex, uv + _MainTex_TexelSize * float2(-detal, -detal)).rgb;
            half3 pixelLT = tex2D(_MainTex, uv + _MainTex_TexelSize * float2(-detal, detal)).rgb;
            half3 pixelRT = tex2D(_MainTex, uv + _MainTex_TexelSize * float2(detal, detal)).rgb;
            half3 pixelRB = tex2D(_MainTex, uv + _MainTex_TexelSize * float2(detal, -detal)).rgb;
            
            return half4((pixelLB + pixelLT + pixelRT + pixelRB) * 0.25, 1);
        }

        ENDCG

        Pass
        {
            Name "ApplyThreshold"
    
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            half _Threshold;


            half4 ApplyThreshold(half4 col) {
                float brightness = max(max(col.r, col.g), col.b);
                float contribute = saturate(brightness - _Threshold) / max(brightness, 0.00001);
                return half4(col.rgb * contribute, 1);
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return ApplyThreshold(BoxSampling(i.uv, 0));
            }

            ENDCG
        }


        Pass
        {
            Name "DownSampling"
    
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            fixed4 frag (v2f i) : SV_Target
            {
                return BoxSampling(i.uv, 0);
            }

            ENDCG
        }


        Pass
        {
            Name "UpSampling"
            Blend One One
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            fixed4 frag (v2f i) : SV_Target
            {
                return BoxSampling(i.uv, 0.5);
            }

            ENDCG
        }

        
        Pass
        {
            Name "Bloom"

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            sampler2D _SrcTex;
            half _BoomStren;

            fixed4 frag (v2f i) : SV_Target
            {
                half3 srcCol = tex2D(_SrcTex, i.uv).rgb;
                half3 bloomCol = BoxSampling(i.uv, 0).rgb * _BoomStren;
                return half4(srcCol + bloomCol, 1);
            }

            ENDCG
        }

        Pass
        {
            Name "Debug"

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            half _BoomStren;

            fixed4 frag (v2f i) : SV_Target
            {
                half4 col = tex2D(_MainTex, i.uv);
                col.rgb *= _BoomStren;
                return col;
            }

            ENDCG
        }

        
    }
}
