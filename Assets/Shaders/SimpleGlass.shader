Shader "Custom/SimpleGlass"
{
    Properties
    {
        _MainTex ("Albedo (RGBA)", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _Opacity ("Opacity", Range(0, 1)) = 0.5
    }

    SubShader
    {
        Tags { 
            "Queue" = "Transparent"
            "RenderType"="Transparent" 
            "ForceNoShadowCasting" = "True"
            }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert alpha:fade

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;
        fixed4 _Color;
        fixed _Opacity;

        struct Input
        {
            float2 uv_MainTex;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            o.Alpha = c.a * _Opacity;   
        }
        ENDCG
    }

    FallBack "Diffuse"
}
