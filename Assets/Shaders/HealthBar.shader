// Upgrade NOTE: upgraded instancing buffer 'Prop' to new syntax.

Shader "Custom/HealthBar"
{
    Properties
    {
        _Fill ("Fill", Range(0, 1)) = 0.5
    }
    SubShader
    {
        Tags {  
                "Queue"="Overlay"
                "IgnoreProjector"="True" 
            }
        Cull Off
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #pragma target 3.5
            #include "UnityCG.cginc"

            UNITY_INSTANCING_BUFFER_START(Props)
            UNITY_DEFINE_INSTANCED_PROP(half, _Fill)
            UNITY_INSTANCING_BUFFER_END(Props)

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };


            v2f vert (appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                UNITY_SETUP_INSTANCE_ID(i);
                half fill = UNITY_ACCESS_INSTANCED_PROP(Props, _Fill);
                fixed3 col = lerp(fixed3(0, 1, 0), fixed3(1, 0, 0), step(i.uv.x, fill));
                return fixed4(col, 1);
            }
            ENDCG
        }
    }
}
