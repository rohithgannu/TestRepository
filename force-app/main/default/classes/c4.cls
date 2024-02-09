public class c4 {
    list<account> acc;
    list<contact> con;
    public list<account> accList{get;set;}
    public Pagereference showall(){
        accList=[select name,Industry from Account];
        return null;
    }

}