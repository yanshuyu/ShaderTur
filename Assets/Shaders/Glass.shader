Shader "Custom/Glass"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "white" {}
        _Color ("Color", Color) = (1, 1, 1, 1)
        _BumpTex ("Bump Texture", 2D) = "bump" {}
        _DistoreAmount("Distore Amount", Range(0.0, 1.0)) = 0.5
    }

    SubShader
    {
        GrabPass { "_GrabSceneTex" }

        Pass
        {

            Tags {
                "Queue" = "Transparent"
                "RenderType" = "Opaque"
                "IgnoreProjector" = "True"
            }

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
                float2 uv_MainTex : TEXCOORD0;
                float4 uv_GrabTex : TEXCOORD1;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _Color;

            sampler2D _BumpTex;
            half _DistoreAmount;

            sampler2D _GrabSceneTex;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv_MainTex = TRANSFORM_TEX(v.uv, _MainTex);
                o.uv_GrabTex = ComputeGrabScreenPos(o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 mainColor = tex2D(_MainTex, i.uv_MainTex) * _Color;

                half2 uvDistore = UnpackNormal(tex2D(_BumpTex, i.uv_MainTex)).xy * _DistoreAmount;

                i.uv_GrabTex.xy += uvDistore;

                fixed4 bgColor = tex2Dproj(_GrabSceneTex, UNITY_PROJ_COORD(i.uv_GrabTex));

                return mainColor * bgColor;
            }
            ENDCG
        }
    }
}
