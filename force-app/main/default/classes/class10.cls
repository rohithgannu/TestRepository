public class class10 {
    public void method1(){
        List<Account> acc1=new List<Account>();
        Account a=new Account(Name='Test Account',Industry='Finance');
        acc1.add(a);
        Insert acc1;
        Account Updateacc=[Select Name,Industry from Account where Name='Test Account' and Industry='Finance'];
        updateacc.Industry='Education';
        update updateacc;
        System.debug('Name='+updateacc.Name+'Industry='+Updateacc.Industry);
        
    }

}