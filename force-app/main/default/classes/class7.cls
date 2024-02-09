public class class7 {

    public void method1(){
     Account[] accts = new List<Account>();
     for(Integer i=0;i<10;i++) {
     Account a = new Account(Name='Test account' + i);
       String s=a.Name;
    accts.add(a);
         System.debug('acc no='+i+'Acc name='+s);
         }
    }
}