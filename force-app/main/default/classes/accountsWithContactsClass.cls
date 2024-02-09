public class accountsWithContactsClass {
@auraEnabled
public static list<account> getAllAccounts()
    {
       list<account> accs =[select id,name,phone,industry,(select lastName from contacts) from account];
      return accs;
    }
}