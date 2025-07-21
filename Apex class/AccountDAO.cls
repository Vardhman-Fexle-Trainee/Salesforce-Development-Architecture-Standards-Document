public without sharing class AccountDAO implements IAccountDAO {

    public Interface IAccountDAO {        
        Map<Id, Account> getAllAccountsByIds(Set<Id> AccountIds);
    }
   
    public static Map<Id, Account> getAllAccountsByIds(Set<Id> AccountIds) {

        Map<Id, Account> AccountMap ;
        if(!(AccountIds == null || AccountIds.isEmpty())) {
            AccountMap = new Map<Id, Account>([SELECT Id, AccountNumber, RecordType.Name FROM Account WHERE Id IN :AccountIds]);
        } 
        return AccountMap;
    }
}