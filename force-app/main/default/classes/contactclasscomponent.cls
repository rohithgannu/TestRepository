public class contactclasscomponent {
    @AuraEnabled
    public static list<contact> fetchContactList1()
    {
        return [select id,name from contact limit 10];    
         
        
    }

}