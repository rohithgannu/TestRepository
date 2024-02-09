trigger competitortrigger2 on Competitor__c (before insert) {

    if(trigger.isbefore && trigger.isupdate){
        for(competitor__c c:trigger.new){
            if(c.primary_competitor__c && c.Opportunity__c!=null){
               
                c.adderror('cantchoose multiple times');
            }
        }
    }
    
    

}