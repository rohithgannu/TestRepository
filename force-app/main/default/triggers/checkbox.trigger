trigger checkbox on Competitor__c (before insert,before update) {
    set<id> idset = new set<id>();
    for(Competitor__c c : trigger.new){
        if(c.Primary_Competitor__c==true){
            idset.add(c.Opportunity__c);
        }
    }
    for(Competitor__c a : trigger.new){
    list<Competitor__c> complist = new list<Competitor__c>([select id,Opportunity__c,Primary_Competitor__c from Competitor__c where Opportunity__c=:idset]);
    for(Competitor__c c : complist){
        if(c.Primary_Competitor__c==true){
            a.adderror('Multiple primary competitors');
        }
    }
    }
}