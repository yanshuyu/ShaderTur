Shader "Custom/PhongRim"
{
    Properties
    {
        _AlbedoMap ("Albedo(RGBA)", 2D) = "white" {}
        _MainColor ("Main Color", Color) = (1, 1, 1, 1)
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _RimColor ("Rim Color", Color) = (1, 1, 1, 1)
        _RimPow ("Rim Power", Range(1, 10)) = 1
        _SpecColor ("Specular Color", Color) = (1, 1, 1, 1)
        _Shininess ("Shininess", Range(0, 1)) = 0.5
        _Gloss ("Gloss", Range(0, 1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf BlinnPhong fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_BumpMap;
            float3 viewDir;
        };

        sampler2D _AlbedoMap;
        sampler2D _NormalMap;
        fixed4 _MainColor;
        fixed4 _RimColor;
        half _Shininess;
        half _Gloss;
        half _RimPow;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutput o)
        {
            fixed4 A = tex2D(_AlbedoMap, IN.uv_MainTex);
            o.Albedo = A.rgb * _MainColor.rgb * unity_ColorSpaceDouble;
            o.Alpha = A.a;
            o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_BumpMap));
            o.Specular = _Shininess;
            o.Gloss = _Gloss;
            
            half K_Rim = 1 - max(0, dot(o.Normal, IN.viewDir));
            o.Emission = _RimColor.rgb * pow(K_Rim, _RimPow);
        }
        ENDCG
    }

    FallBack "Diffuse"
}
