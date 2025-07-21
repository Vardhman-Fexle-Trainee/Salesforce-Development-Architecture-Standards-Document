public without sharing class AccountManager implements IManager {
    
    public static void beforeInsert(List<sObject> newObjList) {
        
        Accounts.someAccountOperation((List<Account>) newObjList);
    }

	public static void beforeUpdate(List<sObject> newObjList, Map<Id,sObject> oldObjMap) {}

	public static void beforeDelete(Map<Id,sObject> oldObjMap) {}

	public static void afterInsert(List<sObject> newObjList) {}
    
	public static void afterUpdate(List<sObject> newObjList, Map<Id,sObject> oldObjMap) {}

	public static void afterDelete(Map<Id,sObject> oldObjMap) {}

	public static void afterUndelete(List<sObject> newObjList) {}
}