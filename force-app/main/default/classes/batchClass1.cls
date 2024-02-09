global class batchClass1 Implements Database.Batchable<sObject> {
    global Database.QueryLocator Start(Database.BatchableContext BC){
        String query='select id,Name from Account Limit 3';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC,list<Account> scope){
        for(Account a:scope)
        {
            a.Name=a.Name +' Absyz1';
        }
        update scope;
        
    }
   
    global void finish(Database.BatchableContext BC){
        
    }
}