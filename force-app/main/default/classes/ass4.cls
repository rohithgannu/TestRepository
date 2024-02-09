public class ass4 {
public static void method()
{
    list<Invoice__c> invc=new list<invoice__c>();
    for(integer i=0;i<10;i++)
    {
        invoice__c inv=new invoice__c();
        inv.Invoice_status__c='open';
           
        invc.add(inv);
    }
    Insert invc;
    meth1(invc);
}
    public static void meth1(list<invoice__c> invc){
        for(invoice__c i:invc)
        {
            i.value__c=100;
            
        }
        update invc;
        system.debug(invc);
    }
}