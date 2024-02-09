public class class11 {
    public  Map<Id,List<Contact>> accountContactMap=new Map<Id,List<Contact>>();{
        
    
        List<Account> lstAccount=[select Id,Name,(Select Id,Name from Contacts)from Account];
    
        for(Account acc : lstAccount)
        {
           this.accountContactMap.put(acc.Id,acc.Contacts);
      }
        System.debug(this.accountContactMap);
     }
}