Shader "Custom/Tessellation"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _EdgeColor ("Edge Color", Color) = (0, 0, 0, 1)
        _EdgeWidth ("Edge Width", Range(1, 10)) = 1
        _TessFactors ("Tess Factors", Vector) = (2, 2, 2, 1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Cull Off

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma hull hull
            #pragma domain doma
            #pragma geometry geom
            #pragma fragment frag
            #pragma target 4.6

            #include "UnityCG.cginc"

            sampler2D _MainTex;
            float4 _MainTex_ST;

            fixed4 _Color;
            fixed4 _EdgeColor;
            half _EdgeWidth;

            fixed4 _TessFactors;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2h
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct d2f
            {
                float2 uv : TEXCOORD0;
                float3 edgeDistance : TEXCOORD1;
                float4 pos : SV_POSITION;
            };

            v2h vert (appdata v)
            {
                v2h o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            [UNITY_domain("tri")]
            [UNITY_outputtopology("triangle_cw")]
            [UNITY_outputcontrolpoints(3)]
            [UNITY_partitioning("integer")]
            [UNITY_patchconstantfunc("tess")]
            v2h hull(InputPatch<v2h, 3> patch, uint id : SV_OutputControlPointID)
            {
                return patch[id];
            }

            struct TessFactors 
            {
                float edgeTess[3] : SV_TessFactor;
                float innerTess : SV_InsideTessFactor;
            };

            TessFactors tess(InputPatch<v2h, 3> patch)
            {
                TessFactors tessFactors;
                tessFactors.edgeTess[0] = _TessFactors.x;
                tessFactors.edgeTess[1] = _TessFactors.y;
                tessFactors.edgeTess[2] = _TessFactors.z;
                tessFactors.innerTess = _TessFactors.w;
                return tessFactors;
            }

            [UNITY_domain("tri")]
            d2f doma(TessFactors tessFactors, OutputPatch<v2h, 3> patch, float3 tessCoord : SV_DomainLocation)
            {
                d2f v;
                v.edgeDistance = (0,0,0);
                v.uv = patch[0].uv * tessCoord.x + patch[1].uv * tessCoord.y + patch[2].uv * tessCoord.z;
                v.pos = patch[0].vertex * tessCoord.x + patch[1].vertex * tessCoord.y + patch[2].vertex * tessCoord.z;
                
                return v;
            }



            [maxvertexcount(3)]
            void geom(triangle d2f gs_in[3], inout TriangleStream<d2f> triStream)
            {
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

                triStream.Append(gs_in[0]);
                triStream.Append(gs_in[1]);
                triStream.Append(gs_in[2]);
            }

            fixed4 frag (d2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv) * _Color;
                float minEdgeDis = min(min(i.edgeDistance.x, i.edgeDistance.y), i.edgeDistance.z);
                minEdgeDis = smoothstep(_EdgeWidth-1, _EdgeWidth+1, minEdgeDis);
                col.rgb = lerp(_EdgeColor.rgb, col.rgb, minEdgeDis);
            
                return col;
            }
            ENDCG
        }
    }
}
