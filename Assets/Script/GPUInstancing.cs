using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GPUInstancing : MonoBehaviour {
    public GameObject instancePrefab;
    public int instanceCount = 5000;
    public int spawnRange = 100;

    private GameObject _instancesHolder;
    
    // Start is called before the first frame update
    void Start() {
        SpawnInstances();
    }

    private void SpawnInstances() {
        if (_instancesHolder) {
            Destroy(_instancesHolder);
            _instancesHolder = null;
        }
        
        _instancesHolder = new GameObject("InstanceHolder");
        _instancesHolder.transform.SetParent(transform);
        MaterialPropertyBlock mtlPropBlock = new MaterialPropertyBlock();
        for (int i = 0; i < instanceCount; i++) {
            mtlPropBlock.SetColor("_Color", new Color(Random.value, Random.value, Random.value, 1));
            mtlPropBlock.SetFloat("_Shininess", Random.Range(0.1f, 1));
            GameObject go = Instantiate(instancePrefab, _instancesHolder.transform);
            float scale = Random.Range(0.6f, 1f);
            go.transform.localPosition = Random.insideUnitSphere * spawnRange;
            go.transform.localScale = new Vector3(scale, scale, scale);
            go.GetComponent<Renderer>().SetPropertyBlock(mtlPropBlock);
        }
    }

}
