public class class8 {
    public void method2(){
        
        Account acc1=[select Industry,type from Account where Account.Name='Test account'];
        acc1.Industry='Education';
        acc1.Type='Account Installation';
        update acc1;
        update acc1;
        System.debug('Name='+Account.Name+'Industry='+acc1.Industry);
    }

}