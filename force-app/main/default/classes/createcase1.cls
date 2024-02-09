public class createcase1 {
    @AuraEnabled
    public static list<case> createcase(case cas)
    {
        list<case> ca;
        if(cas.phone__c !=null)
        {
            ca=[select Phone__c from case where Phone__c=:cas.Phone__c];   
        }
          if( ca !=null){
            return ca;
        }
        else {
            insert cas;    
            return null;
        }
        
    }
    
}