@IsTest
public class MockDAOs 
{
    public class CaseDAOMock implements CaseDAO.ICaseDAO {
        public Map<Id, Case> caseMap = new Map<Id, Case>();

        public Map<Id, Case> getAllCasesByIds(Set<Id> caseIds) {

            return caseMap;
        }
    }

    public class AccountRecordMappingDAOMock implements AccountRecordMappingDAO.IAccountRecordMappingDAO {
        public List<Account_Record_Mapping__c> accountRecordMappingList = new List<Account_Record_Mapping__c>();

        public List<Account_Record_Mapping__c> getAllAccountRecordMappingByRecordTypeName(Set<String> recordTypes) {

            return accountRecordMappingList;
        }
    }

    public class SystemErrorDAOMock implements SystemErrorDAO.ISystemErrorDAO {

        public List<System_Error__c> listOfInsertedSystemError = new List<System_Error__c>();        
                
        public List<System_Error__c> insertErrorLogRecordWithAllDetails(List<System_Error__c> listOfSystemError) 
        {             
            listOfInsertedSystemError.addAll(listOfSystemError);
            return listOfInsertedSystemError;
        }
    }
}