@IsTest
public class Mock {

    public static SObject setFormulafield(SObject sObj, Map<String , Object>fieldNameToValueMap){
        
      String jsonString = JSON.serialize(sObj);
        Map<String,Object> dataMap = (Map<String,Object>)JSON.deserializeUntyped(jsonString);
        for(String fieldName : fieldNameToValueMap.keySet()) {
          dataMap.put(fieldName, fieldNameToValueMap.get(fieldName));
        }
        jsonString = JSON.serialize(dataMap);
        return (SObject)JSON.deserialize(jsonString, SObject.class);
    }
}