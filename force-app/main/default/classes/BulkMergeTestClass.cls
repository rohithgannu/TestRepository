@isTest
public class BulkMergeTestClass {

    static testmethod void test(){
        
        List<Id> accIdList = new List<Id>(); 
        Account acc =new Account();
        acc.Name = 'Test';
        insert acc;
        accIdList.add(acc.Id);
        
        Account accOne =new Account();
        accOne.Name = 'sample';
        insert accOne;
        accIdList.add(accOne.Id);
        
        DuplicateRule dup = [SELECT Id, SobjectType, MasterLabel, DeveloperName, NamespacePrefix FROM DuplicateRule where SobjectType='Account' limit 1];
        System.debug('dup'+dup);
            
        DuplicateRecordSet recordSet = new DuplicateRecordSet();
        recordSet.DuplicateRuleId = dup.Id;
        insert recordSet;
        
        DuplicateRecordItem recordItem = new DuplicateRecordItem();
        recordItem.RecordId =  acc.Id; 
        recordItem.DuplicateRecordSetId = recordSet.ID;
        insert recordItem;
        
        BulkMergeClass.getData(recordSet.Id);
        BulkMergeClass.getValues(recordSet.Id);
        BulkMergeClass.mergeData(acc,acc.Id, accIdList, recordSet.Name);
    }
    
}