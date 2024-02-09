public class ContactSearch {


    public static list<Contact> searchForContacts(String coname,String add){
       
         
            List<Contact> con=[select id,name from Contact where Lastname=:coname AND MailingPostalCode=:add];
             
            System.debug(con);
        return con;
               
               
           
            }
        
   
    
}