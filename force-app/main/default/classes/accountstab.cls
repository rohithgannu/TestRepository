public class accountstab {

    public accountstab(ApexPages.StandardController controller) {

    }

 
    
   
    public list<account> accList{get;set;}
    public Pagereference showall(){
       
       acclist=[select Name,createddate,(select name,id from contacts) from account order by createddate desc limit 10];
        return null;
    }

}