public class class13 {
    public void method1(){
    
        List<Account> accounts = [SELECT Id, Name, (SELECT id FROM Contacts), (SELECT id FROM opportunities) FROM Account];

for (Account a : accounts) {
    system.debug('account='+a+'opportunities='+a.opportunities+'contacts='+a.contacts);
     }
    }
}