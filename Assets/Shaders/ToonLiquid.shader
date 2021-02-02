Shader "Custom/ToonLiquid"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _LiquidColor ("Color", Color) = (1, 1, 1, 1)
        _LiquidTopColor ("Liquid Top Color", Color) = (1, 1, 1, 1)
        _FoamColor ("Foam Color", Color) = (0.75, 0.75, 0.75, 1)
        _FillAmount ("Fill Amount", Range(-10, 10)) = 0.5
        _FoamHeight ("Foam Height", Range(0, 0.1)) = 0.05
        _BottleColor ("Bottle Color", Color) = (1, 1, 1, 0.5)
        _BottleEdge ("Bottle Edge", Range(0, 0.5)) = 0.1
        _RimColor ("Rim Color", Color) = (1, 1, 1, 1)
        _RimPow ("Rom Power", Range(0, 1)) = 0.5
        [HideInInspector] _Wobble ("WobbleX", Vector) = (0, 0, 0, 0)

    }
    SubShader
    {
        Tags { "RenderType"="Transparent"
                "Queue"="Transparent" }
        LOD 100

        Pass
        {
            Cull Off
            //Blend SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float3 normalW : COLOR0;
                float3 viewDir : COLOR1;
                float fillFactor : COLOR2;
                float4 vertex : SV_POSITION;
            };


            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _LiquidColor;
            fixed4 _LiquidTopColor;
            half _FillAmount;
            float3 _Wobble;
            fixed4 _FoamColor;
            half  _FoamHeight;

            fixed4 _RimColor;
            half _RimPow;
         
            		 
            float4 RotateAroundYInDegrees (float4 vertex, float degrees)
            {
                float alpha = degrees * UNITY_PI / 180;
                float sina, cosa;
                sincos(alpha, sina, cosa);
                float2x2 m = float2x2(cosa, sina, -sina, cosa);
                return float4(vertex.yz , mul(m, vertex.xz)).xzyw ;				
            }

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                v.vertex.xyz += _Wobble;
                float3 posW = mul(unity_ObjectToWorld, v.vertex);
                o.normalW = UnityObjectToWorldNormal(v.normal);
                o.viewDir = UnityWorldSpaceViewDir(posW);
                o.fillFactor = posW.y - mul(unity_ObjectToWorld, float4(0,0,0,1)).y;
                return o;
            }

            fixed4 frag (v2f i, fixed facing : VFACE) : SV_Target
            {
                // sample the texture
                fixed4 liquidCol = tex2D(_MainTex, i.uv) * _LiquidColor;
                
                float liquidFactor = step(i.fillFactor, _FillAmount);
                float foamFactor = liquidFactor - step(i.fillFactor, _FillAmount - _FoamHeight);
    
                clip(liquidFactor - 0.01);

                float vdotn = 1 - saturate(dot(i.viewDir, i.normalW));
                half4 rimCol = _RimColor * smoothstep(0.25, 1, pow(vdotn, 8 * _RimPow));
                
                liquidCol.rgb *= liquidFactor;
                liquidCol.rgb += _FoamColor.rgb * foamFactor;
                liquidCol.rgb += rimCol.rgb;

                return  facing > 0 ? liquidCol : _LiquidTopColor;
            }
            ENDCG
        }

        Pass 
        {
            ZWrite Off
            ZTest LEqual
            Blend SrcAlpha OneMinusSrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {   
                float2 uv : TEXCOORD0;
                float3 normalW : COLOR0;
                float3 viewDir : COLOR1;
                float4 vertex : SV_POSITION;
            };


            fixed4 _BottleColor;
            half _BottleEdge;
            fixed4 _RimColor;
            half _RimPow;

            v2f vert (appdata v)
            {
                v2f o;
                v.vertex.xyz += v.normal * _BottleEdge;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.normalW = UnityObjectToWorldNormal(v.normal);
                o.viewDir = UnityWorldSpaceViewDir(mul(unity_ObjectToWorld, v.vertex).xyz);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                half4 bottleCol = _BottleColor;
                float vdotn = 1 - saturate(dot(i.viewDir, i.normalW));
                half4 rimCol = _RimColor * smoothstep(0.25, 1, pow(vdotn, 8 * _RimPow));
                bottleCol.rgb += rimCol.rgb;

                return bottleCol;
            }
            ENDCG

        }

    }
}
