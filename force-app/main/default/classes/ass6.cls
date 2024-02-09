public class ass6 {
    public void merc(){
      
    map<decimal,List<Merc__c>> m=new map<decimal,List<Merc__c>>();
        List<merc__c> l = [select id,quantity__c from merc__c ];
        for(Integer i=0;i<l.size();i++)
        {
            if(math.mod(i,2)==0){
                l[i].quantity__c=100;
                
            }
            else {
                l[i].quantity__c=200;
            }
            m.put(l[i].quantity__C,l);
        }
          system.debug(m);  
        }
    }