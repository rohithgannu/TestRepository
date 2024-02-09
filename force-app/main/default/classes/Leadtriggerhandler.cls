public class Leadtriggerhandler {
 
    public static void method(List<Lead> lead1)
    {
        set<string> str1=new set<string>();
        for(Lead le: Lead1){
            str1.add(le.Email);
        }
        
        map<String,Lead> mapid=new map<String,Lead>();
        for(lead le:[select email,id from lead where email in :str1]){
            mapid.put(le.email,le);
        }

        for(lead le1:lead1){
            if(mapid.get(le1.email).id!=null)
            {
                le1.adderror('email already existed');
            }
            else mapid.get(le1.email);
        }
        
           
        }
    public static void method2(Map<Id,Lead> oldMap,list<lead> lead1)
    {
               set<string> str1=new set<string>();
        for(Lead le: Lead1){
            str1.add(le.Email);
        }
        
        map<String,Lead> mapid=new map<String,Lead>();
        for(lead le:[select email,id from lead where email in :str1]){
            mapid.put(le.email,le);
    }
        for(lead le1:lead1){
            if(oldmap.get(le1.id).email!=le1.Email){
                id exstng=mapid.get(le1.email).id;
                if(exstng!=null)
                le1.adderror('email already exists');
            }
    
    }
    }
}