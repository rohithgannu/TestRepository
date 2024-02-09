public class Merchandiseee {
   public  void method(){
        list<merc__c> m=[select id,name,ordercomplete__c,(select id,merchandise__c,invoice__c from line_item__r) from merc__c where ordercomplete__c=true ];
        list<id> i=new list<id>(); 
        list<invoice__c> inv=new list<invoice__c>();
    
        for(merc__c mer:m){
            for(line_item__c l:mer.line_item__r)
            i.add(l.invoice__c);
        }
            system.debug(i);
       
         list<invoice__c> inv1=new list<invoice__c>();  
          inv1=[select id,Name,ordercomplete__c from invoice__c where id =:i];
            system.debug(inv1);
            
        for(invoice__c invc:inv1){ 
            system.debug(invc);
            invc.ordercomplete__c=true;
            inv.add(invc);
        }
            system.debug(inv);
            update inv;
        }
      
}