global class Lineitemdelete Implements Database.Batchable<sObject> {
    global Database.QueryLocator Start(Database.BatchableContext BC){
        String query1='select id,(select id from Line_item__r) from merc__c';
        return Database.getQueryLocator(query1);
    }
    global void execute(Database.BatchableContext BC,list<merc__C> scope){
       list<Line_item__c> line=new list<Line_item__c>();
       
      for(merc__c a : scope)
          
      {
          for(line_item__c li: a.line_item__r){
      line.add(li);
        
          }
      }
        
   delete line;
    }
    global void finish(Database.BatchableContext BC){
        
    }
}