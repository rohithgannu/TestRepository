public class AccountDelete2{
   
    @AuraEnabled
    public static list<Account> accdetails(){
        list<Account> ac=[select Id,Name,phone from Account];
        return ac;
    }
    @AuraEnabled
    public static list<contact> condetails(String cid){
        list<contact> cc=[select FirstName,LastName,id from contact where id=:cid];
        return cc;
     } 
    @AuraEnabled
    public static contact contact1(contact con)
    {
        insert con;
        return con;
    }
    

}