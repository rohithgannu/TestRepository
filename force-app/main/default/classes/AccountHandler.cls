public class AccountHandler {
    public static void  insertAccount(Integer n){
        List<Account> addAccounts=new List<Account>();
        integer counter=1;
        while(counter<=n)
        {
            Account acc=new Account();
            acc.Name='Acme Inc '+counter;
            acc.AccountNumber='A000'+counter;
            addAccounts.add(acc);
            counter=counter+1;
            
        }
      insert addAccounts;
        
    }

}