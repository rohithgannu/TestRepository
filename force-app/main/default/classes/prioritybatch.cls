global class prioritybatch Implements Database.Batchable<sObject> {
    global Database.QueryLocator Start(Database.BatchableContext BC){
        String query='select Name,Invoice_Total__c,priority__c from Invoice__c';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC,list<invoice__c> invrec){
        for(Invoice__c inv:invrec){
            if(inv.Invoice_Total__C>=0 && inv.Invoice_Total__c<=10000){
                inv.priority__c='Low';
            }
           else if(inv.Invoice_Total__C>10000 && inv.Invoice_Total__c<=5000)
           {             inv.priority__c='Medium';
               
           }
            else if(inv.Invoice_Total__c>50000){
                inv.priority__c='High';
            }
        }
      
        
    }
    
    global void finish(Database.BatchableContext BC){
        
    }
}