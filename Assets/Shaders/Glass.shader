// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Glass"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "white" {}
        _Color ("Color", Color) = (1, 1, 1, 1)
        _BumpTex ("Bump Texture", 2D) = "bump" {}
        _DistoreAmount("Distore Amount", Range(0.0, 1.0)) = 0.5
    }

    SubShader
    {
        // Draw ourselves after all opaque geometry
        Tags { "Queue" = "Transparent" }
 
        // Grab the screen behind the object into _MyGrabTexture
        GrabPass {  }
       
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert addshadow
        #pragma debug
 
        sampler2D _MainTex;
        sampler2D _BumpTex;
        sampler2D _GrabTexture;

        fixed4 _Color;
        float4 _MainTex_ST;
        half _DistoreAmount;
 
        struct Input {
            float2 mainUV;
            float4 grabUV;
        };
 
        void vert (inout appdata_base v, out Input o) {
            UNITY_INITIALIZE_OUTPUT(Input, o);
            o.mainUV = TRANSFORM_TEX(v.texcoord, _MainTex);
            o.grabUV = ComputeGrabScreenPos(UnityObjectToClipPos(v.vertex));
        }
 
        void surf (Input i, inout SurfaceOutput o) {
            fixed4 Col = tex2D(_MainTex, i.mainUV) * _Color;
            half2 uvDistor = UnpackNormal(tex2D(_BumpTex, i.mainUV)).xy * _DistoreAmount;
            i.grabUV.xy += uvDistor;
            o.Albedo = tex2Dproj( _GrabTexture, UNITY_PROJ_COORD(i.grabUV)) * Col;
        }
        
        ENDCG
    }
}
