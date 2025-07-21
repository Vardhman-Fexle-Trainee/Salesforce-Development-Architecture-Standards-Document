public  without sharing class RecordTypeDAO implements IRecordTypeDAO {
    public interface IRecordTypeDAO{
        Map<String,Map<Id,RecordType>> getAllRecordTypes();
        Id getRecordTypeId(String recordTypeDeveloperName, String sObjectAPI);
        List<RecordType> getRecordTypeByIds(Set<Id> recordTypeIds);
        
    }

    public static Map<String, Map<Id,RecordType>> allRecordTypesSObjectMap;     

    public static Map<String,Map<Id,RecordType>> getAllRecordTypes()
    {
        if(allRecordTypesSObjectMap == NULL){
            allRecordTypesSObjectMap = new Map<String,Map<Id,RecordType>>();
            List<RecordType> recList = allRecordTypeList;
            for(RecordType rt: recList){
                Map<Id,RecordType> tempMap = new Map<Id,RecordType>();
                if(allRecordTypesSObjectMap.get(rt.SobjectType) != NULL){
                    tempMap = allRecordTypesSObjectMap.get(rt.SobjectType);
                }
                tempMap.put(rt.Id,rt);
                allRecordTypesSObjectMap.put(rt.SobjectType,tempMap);
            }
        }
        return allRecordTypesSObjectMap;
    }

    public static List<RecordType> allRecordTypeList
    {
        get
        {
            if(allRecordTypeList == NULL)
            {
                allRecordTypeList = [SELECT Id, Name, DeveloperName, SobjectType, Description, IsPersonType, IsActive FROM RecordType ORDER BY Id];
            }
            return allRecordTypeList;
        }
        private set;
    }

    public static Map<String, Map<String, RecordType>> sobjectToDeveloperNameToRecordType
    {
        get
        {
            if ( sobjectToDeveloperNameToRecordType == null)
            {
                sobjectToDeveloperNameToRecordType = new Map<String, Map<String, RecordType>>();
                for ( RecordType rt : allRecordTypeList)
                {
                    if ( !sobjectToDeveloperNameToRecordType.containsKey( rt.SObjectType ) )
                        sobjectToDeveloperNameToRecordType.put( rt.SObjectType, new Map<String, RecordType>() );
                    sobjectToDeveloperNameToRecordType.get( rt.SObjectType ).put( rt.DeveloperName, rt);
                }
            }
            return sobjectToDeveloperNameToRecordType;
        }
        private set;
    }

    public static Id getRecordTypeId(String recordTypeDeveloperName, String sObjectAPI)
    {                
        return sobjectToDeveloperNameToRecordType.get(sObjectAPI).get(recordTypeDeveloperName).ID;
    }

    public static List<RecordType> getRecordTypeByIds(Set<Id> recordTypeIds)
    {
        return [SELECT  Id, Name, SobjectType FROM RecordType WHERE ID IN:recordTypeIds];
    }
}