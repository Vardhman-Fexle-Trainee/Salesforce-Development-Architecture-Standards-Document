@IsTest
public without sharing class TestFactory {
    public TestFactory() {

    }

    public static Case createCase()
    {
        Case caseObj = new Case();
        caseObj.Subject = 'Unit Test Case X';                                
        caseObj.RecordTypeId = CaseConstants.ITR_BANA_LP_CASE_RECORD_TYPE_ID;
        caseObj.Loan_Count__c = 1;
        caseObj.Requestor__c = 'Internal';
        caseObj.Request_Type__c = 'Assurant Report';
        caseObj.Error_Identified__c = 'No Error Identified';
        caseObj.Status = 'New';
        return caseObj;
    }

    public static Account createAccount()
    {
        Account acc = new Account();
        acc.Name = 'Account Name Unit Test XYZ';        
        return acc;
    }

    public static Account_Record_Mapping__c createAccountMappingRecord()
    {
        Account_Record_Mapping__c accMappingRecord = new Account_Record_Mapping__c();
        accMappingRecord.Account__c = getFakeId(Account.sObjectType) ;
        accMappingRecord.Claim_Case_Record_Type__c = 'ITR BANA LP' ;
        accMappingRecord.Claim_Case_Owner_Name__c = 'BANA LP Queue' ;
        accMappingRecord.Email__c = 'test@test.com';
        return accMappingRecord;
    }

    public static EmailMessage createEmailMessage()
    {
        EmailMessage emailMessageRecord = new EmailMessage();
        emailMessageRecord.Block__c = false ;
        emailMessageRecord.FromAddress = 'test@test.com' ;
        emailMessageRecord.ToAddress = 'test@test.com' ;
        emailMessageRecord.Subject = 'Test Email Subject';
        emailMessageRecord.TextBody = 'This is a test email message body';
        return emailMessageRecord;
    }

    static Integer idCounter = 1;
    public static String getFakeId(Schema.SObjectType sot)
    {
        String result = String.valueOf(idCounter);
        idCounter ++;
        return sot.getDescribe().getKeyPrefix() + '0'.repeat(12-result.length()) + result;
    }
}