public class abhandler {
    public static void m(list<B__c> bat)
    {
        set<id> i=new set<id>();
        for(b__c b: bat){
            i.add(b.A__c);
        }
        map<id,A__c> mapid=new map<id,A__c>();
        list<A__c> a=new list<A__c>([select id,Name,fee__c from A__c where id in :i]);
        for(A__c ac:a)
        {
            mapid.put(ac.id,ac);
        }        
        for(b__c b:bat)
        {
            if(b.fee__c==null && mapid.get(b.A__c).fee__c!=null){
                b.fee__c=mapid.get(b.A__c).fee__c;
            }else if(b.fee__c==null && mapid.get(b.A__c).fee__c==null ){
                b.fee__c=1000;
            }
           
        }
        
        
    }

}