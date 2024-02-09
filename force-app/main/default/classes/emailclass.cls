public class emailclass {
    public static void EmailUpdate(list<contact> conlist)
    {
        set<Id> accids=new set<Id>();
        for(contact con: conlist)
        {
            accids.add(con.AccountId);
        }
    
        Map<id,Account>accMap=new Map<id,Account>([select id,Email__c from Account where id in: accids]);
        for(Contact con:conlist)
        {
           con.Email=accMap.get(con.AccountId).Email__c;
             Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
             mail.toAddresses=new String[] { con.Email };
             mail.setSenderDisplayName('rohith');
             mail.subject = 'Email From Contact Trigger';
             mail.plainTextBody = 'This is the message body. you have recieved an mail from contact trigger';
             Messaging.sendEmail(new Messaging.singleEmailMessage[] { mail });

        }
        
    }

}