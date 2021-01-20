Shader "Custom/HullFur"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _FurNoise ("Fur Noise", 2D) = "white" {}
        _FurLen ("Fur Length", Range(0, 1)) = 0.25
        _FurRigidness ("Fur Rigidness", Range(0, 1)) = 0.5
        _FurDensity ("Fur Density", range(0, 1)) = 0.5
        _FurOcclusion ("Fur Occlusion", range(0, 1)) = 0.5
        _Gravity ("Gravity", Vector) = (0, -9.8, 0, 0)
    }
    SubShader
    {
        Tags { 
           "RenderType"="Transparent" 
            "Queue" = "Transparent"
            }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0
        #include "HullFurPass.cginc"
        ENDCG 
        
        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.05
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.1
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.15
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.2
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.25
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.3
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.35
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.4
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.45
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.5
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.55
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.6
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.65
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.7
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.75
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.8
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.85
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.9
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 0.95
        #include "HullFurPass.cginc"
        ENDCG 

        CGPROGRAM 
        #pragma surface surf Standard fullforwardshadows alpha:fade vertex:vert 
        #pragma target 3.0 
        #define FUR_STEP 1
        #include "HullFurPass.cginc"
        ENDCG 

    }
    FallBack "Diffuse"
}
