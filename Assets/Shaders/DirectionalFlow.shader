Shader "Custom/DirectionalFlow"
{
    Properties
    {
        [HDR]_Color ("Color", Color) = (1,1,1,1)
        [NoScaleOffset] _MainTex ("Derivative(AG) Height(B)", 2D) = "black" {}
        [NoScaleOffset] _FlowMap ("Flow Map(RG), Noise(A)", 2D) = "black" {}
        _Tiling ("Tiling", Float) = 1
        _GrideResolution ("Gride Resolution", Float) = 10
        _GrideOffset ("Gride Offset(XY)", Vector)= (0, 0, 0, 0)
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _FlowStren ("Flow Strength", Float) = 1
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
        half _Tiling;
        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        sampler2D _FlowMap;
        half _FlowStren;
        half _FlowOffset;
        half _Speed;

        half _GrideResolution;
        half2 _GrideOffset;

        struct Input
        {
            float2 uv_MainTex;
        };
        
        float2 DirectionalFlowUV(float2 uv, float2 flowVec, float tiling, out float2x2 rot)
        {
            float2 flowDir = normalize(flowVec);
            float flowSpeed = length(flowVec) * _FlowStren;
            rot = float2x2(flowDir.y, -flowDir.x, flowDir.x, flowDir.y);
            rot *= flowSpeed;
            uv = mul(rot, uv);
            float t = _Time.y * _Speed;
            uv.y += t;
            uv *= tiling;
            return uv;
        }

    	float3 UnpackDerivativeHeight (float4 textureData) {
			float3 dh = textureData.agb;
			dh.xy = dh.xy * 2 - 1;
			return dh;
		}

        void surf (Input IN, inout SurfaceOutputStandard o)
        {   
            float2 grideUV =  floor(IN.uv_MainTex * _GrideResolution + _GrideOffset) / _GrideResolution;
            float4 flowVec = tex2D(_FlowMap, grideUV)* 2 - 1;
            float2x2 rot;
            float2 flowUV = DirectionalFlowUV(IN.uv_MainTex, flowVec.xy, _Tiling, rot);
            float3 dh = UnpackDerivativeHeight(tex2D(_MainTex, flowUV));
            dh.xy = mul(rot, dh.xy);
            o.Albedo = dh.z * dh.z * _Color;
            o.Normal = normalize(float3(-dh.xy, 1));
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = _Color.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
