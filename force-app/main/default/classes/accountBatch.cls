global class accountBatch Implements Database.Batchable<sObject> {
    global Database.QueryLocator Start(Database.BatchableContext BC){
        String query1='select id,Name,(select id from contacts) from account';
        return Database.getQueryLocator(query1);
    }
    global void execute(Database.BatchableContext BC,list<Account> scope){
       
      for(Account a : scope)
      {
          Integer i=0;
          
          for(contact contact_record:a.contacts ){
              i++;
          }
          a.count__c=i;
      }
        database.update(scope);
        
        
    }
   
    global void finish(Database.BatchableContext BC){
        
    }
}