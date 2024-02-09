public class class9 {
    
    public void method5(){
        
Account[] accts1 = new List<Account>();
for(Integer i=0;i<3;i++) {
Account a = new Account(Name='Test account' + i,
Industry='Education');
    accts1.add(a);
}
Account accountToUpdate;
insert accts1;       
 accountToUpdate =
        [SELECT Industry FROM Account
 WHERE Name='Test Account' AND Industry='Education' LIMIT 1]; accountToUpdate.Industry = 'Education';
update accountToUpdate;
        System.debug('Name='+Account.Name+'industry='+Account.Industry);
         }
}