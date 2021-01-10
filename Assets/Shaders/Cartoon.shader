Shader "Custom/Cartoon"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _ShadingLevel ("Shading Level", Int) = 3
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Cartoon fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;
        fixed4 _Color;
        int _ShadingLevel;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }

        half4 LightingCartoon(SurfaceOutput mat, UnityGI gi) {
            UnityLight light = gi.light;
            half NdotL = saturate(dot(mat.Normal, light.dir));
            half levelAtte = floor(_ShadingLevel * NdotL) / (_ShadingLevel - 0.5);
            half4 C;
            C.rgb = light.color * levelAtte * mat.Albedo; 
            C.a = mat.Alpha;

            #ifdef UNITY_LIGHT_FUNTION_INDIRCT 
                C.rgb += o.Albedo * gi.indirect.diffuse;
            #endif

            return C;
        }

        inline void LightingCartoon_GI(SurfaceOutput mat, UnityGIInput giData, inout UnityGI gi) {
            gi = UnityGlobalIllumination(giData, 1, mat.Normal);
        }

        ENDCG
    }
    FallBack "Diffuse"
}
