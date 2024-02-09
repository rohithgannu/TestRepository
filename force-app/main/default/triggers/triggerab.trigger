trigger triggerab on B__c (before insert) {
    set<decimal> setid=new set<decimal>();
    for(b__c b: trigger.new){
        setid.add(b.fee__c);
            
    }
    map<decimal,A__c> mapid=new map<decimal,A__c>();
    list<A__c> a=[select fee__c,Name from A__c where fee__c in:setid];
    for(A__c ab: a)
    {
       mapid.put(ab.fee__c,ab);
    }
    
    for(b__c b:trigger.new)
    {
        if(mapid.containskey(b.fee__c)){
            if(b.fee__c==null)
            {
                b.A__c=mapid.get(b.fee__c).id;
                b.fee__c=b.A__r.fee__c;
            }
               else  if(b.A__r.fee__c==null)
                {
                    b.fee__c=1000;
                }
            }
            
        }
    }