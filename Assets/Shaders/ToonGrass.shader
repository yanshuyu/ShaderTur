Shader "Custom/ToonGrass"
{
    Properties
    {
        _TipColor ("Tip Color", Color) = (1, 1, 1, 1)
        _BottomColor ("Bottom Color", Color) = (1, 1, 1, 1)
        _WidthRange ("Min/Max Width", Vector) = (0.5, 1, 0, 0)
        _HeightRange ("Min/Max Height", Vector) = (0.5, 1, 0, 0)
        _WidthRandomness ("Width Randomness", Range(0, 1)) = 0.5
        _HeightRandomness ("Height Randomness", Range(0, 1)) = 0.5
        _FacingRandomness ("Facing Randomness", Range(0, 1)) = 0.5
        _BendRandomness ("Bend Randomness", Range(0, 1)) = 0.5
        _WindFlowMap ("Wind Flow", 2D) = "black" {}
        _WindFrequence ("Wind Frequence", Range(0, 1)) = 0.5
        _windStren ("Wind Strength", Range(0, 1)) = 1
    }

    SubShader
    {
        CGINCLUDE
        // Simple noise function, sourced from http://answers.unity.com/answers/624136/view.html
        // Extended discussion on this function can be found at the following link:
        // https://forum.unity.com/threads/am-i-over-complicating-this-random-function.454887/#post-2949326
        // Returns a number in the 0...1 range.
        float rand(float3 co)
        {
            return frac(sin(dot(co.xyz, float3(12.9898, 78.233, 53.539))) * 43758.5453);
        }

        // Construct a rotation matrix that rotates around the provided axis, sourced from:
        // https://gist.github.com/keijiro/ee439d5e7388f3aafc5296005c8c3f33
        float3x3 AngleAxis3x3(float angle, float3 axis)
        {
            float c, s;
            sincos(angle, s, c);

            float t = 1 - c;
            float x = axis.x;
            float y = axis.y;
            float z = axis.z;

            return float3x3(
                t * x * x + c, t * x * y - s * z, t * x * z + s * y,
                t * x * y + s * z, t * y * y + c, t * y * z - s * x,
                t * x * z - s * y, t * y * z + s * x, t * z * z + c
                );
        }
        ENDCG

        Pass
        {
            Tags  {
                    "LightMode" = "ForwardBase"
                  }
            Cull Off

            CGPROGRAM
            #pragma vertex vert
            #pragma geometry geom
            #pragma fragment frag
            #pragma target 4.6

            #include "UnityCG.cginc"

            fixed4 _TipColor;
            fixed4 _BottomColor;
            half2 _WidthRange;
            half2 _HeightRange;
            half _WidthRandomness;
            half _HeightRandomness;
            half _FacingRandomness;
            half _BendRandomness;

            sampler2D _WindFlowMap;
            float4 _WindFlowMap_ST;
            half _WindFrequence;
            half _windStren;

            struct appdata
            {
                float4 vertex : POSITION;
                float4 tangent : TANGNET;
                float3 normal : NORMAL;
            };

            struct v2g
            {
                float4 pos : POSITION;
                float4 tangent : TANGNET;
                float3 normal : NORMAL;
            };

            struct g2f
            {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2g vert (appdata v)
            {
                v2g o;
                o.pos = v.vertex;
                o.tangent = v.tangent;
                o.normal = v.normal;
                return o;
            }

            [maxvertexcount(3)]
            void geom(triangle v2g i[3], inout TriangleStream<g2f> triStream) 
            {
                float3 pos = (i[0].pos + i[1].pos + i[2].pos) / 3;
                half3 bitangent = cross(i[0].normal, i[0].tangent.xyz) * i[0].tangent.w * unity_WorldTransformParams.w;
                float3x3 toLocalSpace = { 
                    i[0].tangent.x, bitangent.x, i[0].normal.x,
                    i[0].tangent.y, bitangent.y, i[0].normal.y,
                    i[0].tangent.z, bitangent.z, i[0].normal.z,
                };
                
                float w = lerp(_WidthRange.x, _WidthRange.y, rand(i[0].pos) * _WidthRandomness);
                float h = lerp(_HeightRange.x, _HeightRange.y, rand(i[1].pos) *  _HeightRandomness);
                float3x3 facingRot = AngleAxis3x3(rand(i[2].pos) * UNITY_TWO_PI * _FacingRandomness, i[0].normal);
                float3x3 bendRot = AngleAxis3x3((rand(pos) - 0.5) * UNITY_PI * _BendRandomness, bitangent);
                
                float2 windUV = pos.xz * _WindFlowMap_ST.xy + _WindFlowMap_ST.zw + _Time.y * _WindFrequence;
                float2 wind = (tex2Dlod(_WindFlowMap, float4(windUV,0,0)).xy * 2 - 1) * _windStren;
                float3 windDir = normalize(float3(wind, 0));
                float3x3 windRot = AngleAxis3x3(wind * UNITY_PI, windDir);
                
                float3x3 transform = mul(mul(mul(facingRot, bendRot), windRot), toLocalSpace);
                
                g2f v;
                v.pos = UnityObjectToClipPos(pos + mul(transform, float3(-w * 0.5 , 0, 0)));
                v.uv = (0, 0);
                triStream.Append(v);

                v.pos = UnityObjectToClipPos(pos + mul(transform, float3(w * 0.5, 0, 0)));
                v.uv = (1, 0);
                triStream.Append(v);
                
                v.pos = UnityObjectToClipPos(pos + mul(transform, float3(0, 0, h)));
                v.uv = (0.5, 1);
                triStream.Append(v);
             }

            fixed4 frag (g2f i) : SV_Target
            {
                return lerp(_BottomColor, _TipColor, i.uv.y);
            }

            ENDCG
        }
    }
}
