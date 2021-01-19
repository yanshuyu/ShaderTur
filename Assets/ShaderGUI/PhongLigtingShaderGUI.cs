using UnityEngine;
using UnityEditor;


public class PhongLigtingShaderGUI : ShaderGUI
{
    static string PropertyName_AlbedoMap = "_MainTex";
    static string PropertyName_MainColor = "_Color";
    static string PropertyName_NormalMap = "_NormalMap";
    static string PropertyName_SpecColor = "_SpecColor";
    static string PropertyName_Shininess = "_Shininess";
    static string PropertyName_EmissiveMap = "_EmissiveMap";
    static string PropertyName_EmissiveColor = "_EmissiveColor";
    static string PropertyName_OcclusionMap = "_OcclusionMap";
    static string  PropertyName_OcclusionStren = "_OcclusionStrength";
    static string PropertyName_AlphaThreshold = "_Cutoff";
    static string PropertyName_SpecReflectivity = "_SpecReflectivity";
    static string PropertyName_ScrBlendFactor = "_SrcBlendFactor";
    static string PropertyName_DstBlendFactor = "_DstBlendFactor";
    static string PropertyName_ZWrite = "_Zwrite";
    static string PropertyName_EnvReflectivity = "_EnvReflectivity";
    static string PropertyName_EnvReflectStrength = "_EnvReflectStrength";

    static string KeyWord_NormalMap_Enabled = "NORMAL_MAP_ENABLED";
    static string keyWord_OcclusionMap_Enabled = "OCCLUSION_MAP_ENABLED";
    static string KeyWord_Environment_Reflection_Enabled = "ENVRONMENT_REFLCTION_ENABLED";
    static string KeyWord_Environment_Reflection_Box_Projection_Enabled = "ENVRONMENT_REFLCTION_BOX_PROJECTION_ENABLED";
    static string KeyWord_RenderMode_Opaque = "RENDER_MODE_OPAQUE";
    static string KeyWord_RenderMode_Cutout = "RENDER_MODE_CUTOUT";
    static string KeyWord_RenderMode_Fade = "RENDER_MODE_FADE";
    static string KeyWord_RenderMode_Transparent = "RENDER_MODE_TRANSPARENT";

    Material activeMaterial;

    enum RenderMode {
        Opaque,
        Cutout,
        Fade,
        Transparent,
    }

    GUIContent GUILableForProperty(MaterialProperty prop, string tip = null) {
        return new GUIContent(prop.displayName, tip);
    }

    void SetKeyWordEnabled(string keyWord, bool enable) {
        if (enable)
            activeMaterial.EnableKeyword(keyWord);
        else 
            activeMaterial.DisableKeyword(keyWord);
    }

    RenderMode GetRenderMode() {
        RenderMode mode = RenderMode.Opaque;
        if (activeMaterial.IsKeywordEnabled(KeyWord_RenderMode_Cutout))
            mode = RenderMode.Cutout;
        else if (activeMaterial.IsKeywordEnabled(KeyWord_RenderMode_Fade))
            mode = RenderMode.Fade;
        else if (activeMaterial.IsKeywordEnabled(KeyWord_RenderMode_Transparent))
            mode = RenderMode.Transparent;

        return mode;
    }

    void SetRenderMode(RenderMode mode) {
        SetKeyWordEnabled(KeyWord_RenderMode_Cutout, mode == RenderMode.Cutout);
        SetKeyWordEnabled(KeyWord_RenderMode_Fade, mode == RenderMode.Fade);
        SetKeyWordEnabled(KeyWord_RenderMode_Transparent, mode == RenderMode.Transparent);

        if (mode == RenderMode.Opaque) {
            activeMaterial.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Geometry;
            activeMaterial.SetOverrideTag("RenderType", "Opaque");
            activeMaterial.SetInt(PropertyName_ScrBlendFactor, (int)UnityEngine.Rendering.BlendMode.One);
            activeMaterial.SetInt(PropertyName_DstBlendFactor, (int)UnityEngine.Rendering.BlendMode.Zero);
            activeMaterial.SetInt(PropertyName_ZWrite, 1);

        }  else if (mode == RenderMode.Cutout) {
            activeMaterial.renderQueue = (int)UnityEngine.Rendering.RenderQueue.AlphaTest;
            activeMaterial.SetOverrideTag("RenderType", "TransparentCutout");
            activeMaterial.SetInt(PropertyName_ScrBlendFactor, (int)UnityEngine.Rendering.BlendMode.One);
            activeMaterial.SetInt(PropertyName_DstBlendFactor, (int)UnityEngine.Rendering.BlendMode.Zero);
            activeMaterial.SetInt(PropertyName_ZWrite, 1);

        }  else if (mode == RenderMode.Fade) {
            activeMaterial.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent;
            activeMaterial.SetOverrideTag("RenderType", "Transparent");
            activeMaterial.SetInt(PropertyName_ScrBlendFactor, (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
            activeMaterial.SetInt(PropertyName_DstBlendFactor, (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
            activeMaterial.SetInt(PropertyName_ZWrite, 0);
        } else {
            activeMaterial.renderQueue = (int)UnityEngine.Rendering.RenderQueue.Transparent;
            activeMaterial.SetOverrideTag("RenderType", "Transparent");
            activeMaterial.SetInt(PropertyName_ScrBlendFactor, (int)UnityEngine.Rendering.BlendMode.One);
            activeMaterial.SetInt(PropertyName_DstBlendFactor, (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
            activeMaterial.SetInt(PropertyName_ZWrite, 0);
        }
    }

    public override void OnGUI(MaterialEditor editor, MaterialProperty[] properties) {
        activeMaterial = editor.target as Material;

        // render mode
        RenderMode renderMode = GetRenderMode();

        EditorGUI.BeginChangeCheck();
        renderMode = (RenderMode)EditorGUILayout.EnumPopup("Render Mode", renderMode);
        if (EditorGUI.EndChangeCheck()) {
            editor.RegisterPropertyChangeUndo("Render Mode");
            SetRenderMode(renderMode);
        }
        if (renderMode == RenderMode.Cutout) {
            MaterialProperty alphaThreshold = FindProperty(PropertyName_AlphaThreshold, properties);
            editor.ShaderProperty(alphaThreshold, GUILableForProperty(alphaThreshold));
        } else if (renderMode == RenderMode.Transparent) {
            MaterialProperty rel = FindProperty(PropertyName_SpecReflectivity, properties);
            EditorGUI.indentLevel += 2;
            editor.ShaderProperty(rel, GUILableForProperty(rel));
            EditorGUI.indentLevel -= 2;
        }


        // albedo & main color
        MaterialProperty abledoMap = FindProperty(PropertyName_AlbedoMap, properties);
        editor.TexturePropertySingleLine(GUILableForProperty(abledoMap), abledoMap, FindProperty(PropertyName_MainColor, properties));

        // emission
        MaterialProperty emissiveMap = FindProperty(PropertyName_EmissiveMap, properties);
        editor.TexturePropertySingleLine(GUILableForProperty(emissiveMap), emissiveMap, FindProperty(PropertyName_EmissiveColor, properties));

        MaterialProperty occlusionMap = FindProperty(PropertyName_OcclusionMap, properties);
        EditorGUI.BeginChangeCheck();
        editor.TexturePropertySingleLine(GUILableForProperty(occlusionMap), occlusionMap, occlusionMap.textureValue ? FindProperty(PropertyName_OcclusionStren, properties) : null);
       if(EditorGUI.EndChangeCheck()) {
           SetKeyWordEnabled(keyWord_OcclusionMap_Enabled, occlusionMap.textureValue);
       }


        // normal map
        MaterialProperty normalMap = FindProperty(PropertyName_NormalMap, properties);
        EditorGUI.BeginChangeCheck();
        editor.TexturePropertySingleLine(GUILableForProperty(normalMap), normalMap);
        if (EditorGUI.EndChangeCheck()) {
            SetKeyWordEnabled(KeyWord_NormalMap_Enabled, normalMap.textureValue);
        }
        

        // spec & shininess
        MaterialProperty specColor = FindProperty(PropertyName_SpecColor, properties);
        MaterialProperty shininess = FindProperty(PropertyName_Shininess, properties);
        editor.ShaderProperty(specColor, GUILableForProperty(specColor));
        editor.ShaderProperty(shininess, GUILableForProperty(shininess));

        // environment reflection probe
        bool envReflEnabled = activeMaterial.IsKeywordEnabled(KeyWord_Environment_Reflection_Enabled);
        EditorGUI.BeginChangeCheck();
        envReflEnabled = EditorGUILayout.Toggle("Environment Reflection", envReflEnabled);
        if (EditorGUI.EndChangeCheck()) {
            SetKeyWordEnabled(KeyWord_Environment_Reflection_Enabled, envReflEnabled);
        }
        if (envReflEnabled) {
            MaterialProperty reltivity = FindProperty(PropertyName_EnvReflectivity, properties);
            MaterialProperty relStren = FindProperty(PropertyName_EnvReflectStrength, properties);
            bool boxProjEnabled = activeMaterial.IsKeywordEnabled(KeyWord_Environment_Reflection_Box_Projection_Enabled);
            EditorGUI.indentLevel += 2;
            EditorGUI.BeginChangeCheck();
            boxProjEnabled = EditorGUILayout.Toggle("Box Projection", boxProjEnabled);
            if(EditorGUI.EndChangeCheck()) {
                SetKeyWordEnabled(KeyWord_Environment_Reflection_Box_Projection_Enabled, boxProjEnabled);
            }
            editor.ShaderProperty(reltivity, GUILableForProperty(reltivity));
            editor.ShaderProperty(relStren, GUILableForProperty(relStren));
            EditorGUI.indentLevel -= 2;
        }


        editor.TextureScaleOffsetProperty(abledoMap);
    }
}
