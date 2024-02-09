trigger invoicedeletetrigger on Invoice__c (before delete) {
    list<invoice__c> i=new List<invoice__c>();
    for(invoice__c c:trigger.old)
    {
        if(c.Invoice_status__c=='closed')
            {
                c.adderror('cannot delete invoice records');
            }
    }
    
    

}