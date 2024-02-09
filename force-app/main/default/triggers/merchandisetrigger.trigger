trigger merchandisetrigger on Merc__c (after update) {
    list<merc__c> cub=new list<merc__c>([select id,Quantity__c,(select unit_price__c from line_item__r)from merc__c where quantity__c=20]); 
         list<line_item__c> c1=new list<line_item__c>();
    for(merc__c c:trigger.new)
         {
             for(line_item__c r: c.line_item__r){
                 
                 r.unit_price__c=(r.unit_price__c*2);
                 c1.add(r);
             }
            
         }
   update c1;
}