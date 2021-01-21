Shader "Custom/Cartoon"
{
    Properties
    {
        _ShadingLevel ("Shading Level", Int) = 3
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        [HDR] _Color ("Color", Color) = (1,1,1,1)
        [HDR] _SpecColor ("Specular Color", Color) = (0.9, 0.9, 0.9, 1)
        [HDR] _RimColor ("Rim Color", Color) = (0.9, 0.9, 0.9, 1)
        [HDR] _AmbientColor("Ambient Color", Color) = (0, 0, 0, 1)
        _Shininess ("Shininess", Range(0, 1)) = 0.5
        _RimEdge ("Rim Edge", range(0, 1)) = 0.2
        _RimStrength ("Rim Strength", Range(0, 1)) = 0.5

    }

    SubShader
    {
        Tags { "RenderType"="Opaque"
                //"PassFlags"="OnlyDirectional" 
             }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Cartoon  fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;
        half4 _Color;
        //half4 _SpecColor;
        half4 _RimColor;
        half4 _AmbientColor;
        half _Shininess;
        half _RimEdge;
        half _RimStrength;
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
            o.Gloss = _Shininess;
            o.Alpha = c.a;
        }

        half4 LightingCartoon(SurfaceOutput s, half3 V, UnityGI gi) {
            half4 C = (0, 0, 0, 1);
            UnityLight light = gi.light;
            half NdotL = saturate(dot(s.Normal, light.dir));
            half Kd = floor(_ShadingLevel * NdotL) / (_ShadingLevel - 0.5);
            C.rgb = light.color * s.Albedo * Kd; 

            half3 H = normalize(light.dir + V);
            half NdotH = saturate(dot(s.Normal, H));
            half Ks = pow(NdotH, s.Gloss * 256) * NdotL;
            Ks = smoothstep(0.1, 0.2, Ks);
            C.rgb += light.color * _SpecColor.rgb * Ks;

            half Krim = 1 - saturate(dot(s.Normal, V));
            Krim = smoothstep(1 - _RimEdge, 1 - _RimEdge + 0.05, Krim) * NdotL;
            C.rgb += _RimColor.rgb * Krim * _RimStrength;

            C.rgb += _AmbientColor.rgb * pow(1 - Kd, _ShadingLevel);
            C.a = s.Alpha;

            // #ifdef UNITY_LIGHT_FUNTION_INDIRCT 
            //     C.rgb += o.Albedo * gi.indirect.diffuse;
            // #endif

            return C;
        }

        inline void LightingCartoon_GI(SurfaceOutput mat, UnityGIInput giData, inout UnityGI gi) {
            gi = UnityGlobalIllumination(giData, 1, mat.Normal);
        }

        ENDCG
    }
    FallBack "Diffuse"
}
