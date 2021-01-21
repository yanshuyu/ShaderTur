Shader "Custom/DistortionFlow"
{
    Properties
    {
        [HDR]_Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        [NoScaleOffset] _FlowMap ("Flow Map(RG), Noise(A)", 2D) = "black" {}
        [NoScaleOffset] _FlowNormal ("Flow Normal", 2D) = "bump" {}
        _JumpU ("Jump U", Range(-0.25, 0.25)) = 0.25
        _JumpV ("Jump V", Range(-0.25, 0.25)) = 0.25
        _FlowStren ("Flow Strength", Float) = 1
        _FlowOffset ("Flow Offset", Float) = 0
        _Speed ("Speed", Float) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque"
                "IgnoreProjector"="True"
         }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;
        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        sampler2D _FlowMap;
        sampler2D _FlowNormal;
        half _JumpU;
        half _JumpV;
        
        half _FlowStren;
        half _FlowOffset;
        half _Speed;

        struct Input
        {
            float2 uv_MainTex;
        };

        float3 FlowUVW(float2 uv, float3 flowVec, float phaseOffset, float2 uvJump, half speed, half flowOffset) {
            float3 uvw;
            float t = _Time.y * speed + flowVec.z + phaseOffset;
            float progress = frac(t);
            uvw.xy = uv - flowVec.xy * (progress + flowOffset);
            uvw.xy += floor(t) * uvJump;
            uvw.z = 1 - abs(1 - 2*progress);
            return uvw;
        }


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float4 flowVec = tex2D(_FlowMap, IN.uv_MainTex) * 2 - 1;
            flowVec.xy *=  _FlowStren;
            flowVec.z = flowVec.w; // noise
            float2 uvJump = (_JumpU, _JumpV);
            float3 uvwA = FlowUVW(IN.uv_MainTex, flowVec, 0, uvJump, _Speed, _FlowOffset);
            float3 uvwB = FlowUVW(IN.uv_MainTex, flowVec, 0.5, uvJump, _Speed, _FlowOffset);
            fixed4 ColA = tex2D (_MainTex, uvwA.xy) * uvwA.z;
            fixed4 ColB = tex2D(_MainTex, uvwB.xy) * uvwB.z;
            fixed4 Col = (ColA + ColB) * _Color;

            half3 NorA = UnpackNormal(tex2D(_FlowNormal, uvwA.xy)) * uvwA.z;
            half3 NorB = UnpackNormal(tex2D(_FlowNormal, uvwB.xy)) * uvwB.z;

            o.Albedo = Col.rgb;
            o.Normal = normalize(NorA + NorB);
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = Col.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
