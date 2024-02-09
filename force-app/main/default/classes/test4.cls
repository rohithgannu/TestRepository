public class test4 {
   
        list<merc__c> m=[select id,name,ordercomplete__c,(select id,merchandise__c,invoice__c from line_item__r) from merc__c where ordercomplete__c=true ];
        
    list<id> i=new list<id>(); 
        list<invoice__c> inv=new list<invoice__c>();
        public  void method(){
        for(merc__c mer:m){
            for(line_item__c l:mer.line_item__r)
            i.add(l.invoice__c);
        }
            system.debug(i);
          inv=[select id,Name,ordercomplete__c from invoice__c where id in:i];
            system.debug(inv);
            
        for(invoice__c invc:inv){ 
            system.debug(invc);
            invc.ordercomplete__c=true;
            inv.add(invc);
        }
            system.debug(inv);
            update inv;
        }
    }