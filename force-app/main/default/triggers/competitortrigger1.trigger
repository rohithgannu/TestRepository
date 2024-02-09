trigger competitortrigger1 on Competitor__c (before insert,before update) {
    Map<string,competitor__c> accMap = new Map<string,competitor__c>();
set<string> accSet = new set<string>();
    for(competitor__c acc : Trigger.new)
        accSet.add(acc.name);
    for(competitor__c a : [select id,name,primary_competitor__c from competitor__c where name in : accSet])
        accMap.put(a.name,a);
    for(competitor__c acc1 : trigger.new)
        {
        
        if(accMap.containskey(acc1.name) && acc1.Primary_Competitor__c==true && accmap.size()>0)
        {
             acc1.addError('There is another account in the system with this exact name and is a likely duplicate');
           }
        
           }
        }