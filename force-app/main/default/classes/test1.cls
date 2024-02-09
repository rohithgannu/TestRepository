public class test1 {
    public void merc(){
    Map<Merc__c,List<Line_Item__c>> m=new Map<Merc__c,list<Line_Item__c>>();
    for(Merc__c r:[select id,(select id from Line_item__r)from merc__c]){
        
        m.put(r,r.Line_item__r);
    }
    System.debug(m);
    }
    }