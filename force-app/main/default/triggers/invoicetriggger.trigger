trigger invoicetriggger on Invoice__c (before insert) {
    list<Invoice__c> inv=new List<Invoice__c>();
    for(invoice__c c:trigger.new){
        c.Name=c.Name+'Absyz';
        inv.add(c);
    }

}