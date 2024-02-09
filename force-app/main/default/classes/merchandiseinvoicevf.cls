public class merchandiseinvoicevf{


 
    
   
   public merc__c newmer {get;set;}
    public merchandiseinvoicevf(ApexPages.StandardController controller) {

        newmer=(merc__c)controller.getrecord();
    }

    

    
    public pagereference edit(){
        String id = ApexPages.currentPage().getParameters().get('id');

 

       newmer=[select id,Name,(select  id,Name,invoice__r.Invoice_Status__c from Line_item__r) from merc__c where id =:id][0];
        update newmer;
        
     return null;

      
   }

}