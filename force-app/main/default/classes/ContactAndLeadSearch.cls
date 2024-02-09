public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String name){
        
        List<List<SObject>> so=[FIND :name IN ALL FIELDS 
                   RETURNING Contact(Name),Lead(Name)];
        Contact[] searchContacts = (Contact[])so[0];
       System.debug('Found the following accounts.');
      for (Contact c : searchContacts) {
     System.debug(c.Name);
     }
       return so;
    }

}