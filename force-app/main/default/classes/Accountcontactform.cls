public class Accountcontactform {


 
    
   
   public Contact newCon {get;set;}
     public Accountcontactform(ApexPages.StandardController con) {
         newCon = new contact();

    }
    
    public pagereference save(){
      Account a = New Account(Name =+ newCon.LastName);
      Insert a;
      newCon.AccountID = a.id;
      insert newCon;

      Pagereference pr = New PageReference('/' + a.id);
      return pr;
   }

}