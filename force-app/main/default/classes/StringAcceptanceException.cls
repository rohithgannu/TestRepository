public class StringAcceptanceException extends Exception{
    public void method(string s){
   
       list<contact> c=new List<contact>([select LastName from Contact]);
        
        try{
             contact con=new contact();
            for(Contact cc:c){
                if(s.equals(cc.lastName)){
                    throw new StringAcceptanceException('last Name exception');
                }
                else{
                     
                    con.LastName=s;
                    
                }
            }
            insert con;
        }
                catch(StringAcceptanceException e){
                    Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
     String[] toAddresses = new String[] {'rohith.gannu333@gmail.com'};
     mail.setToAddresses(toAddresses);
    // mail.setReplyTo('support@id.com');
     mail.setSenderDisplayName('Apex error message');
     mail.setSubject('Error from Org : ' + UserInfo.getOrganizationName());
     mail.setPlainTextBody(e.getMessage());
     Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
                }
            
        
    }

}