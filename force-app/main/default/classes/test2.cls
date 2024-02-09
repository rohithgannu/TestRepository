public class test2 {
    public void method(){
        List<invoice__c> i=[select id,Name,(select line_item_total__c from line_item__r)from  invoice__c];
        List<line_item__c> line=new List<line_item__c>();
        Decimal sum=0;
        for(invoice__c ir : i){
            for(line_item__c li: ir.line_item__r){
                sum=sum+li.line_item_total__c;
           
            if(sum>0)
            {
                ir.Invoice_Status__c='closed';
               
            }
             i.add(ir);
        }
     
    }
   
       update i;
    system.debug(i);
}
}