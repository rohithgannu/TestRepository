public class personbusinessAccount {
    public account acc {get;set;}
     public account conlst {get;set;}
    public boolean person {get;set;}
    public boolean business{get;set;}
    public pagereference selacc()
    {
       string getid=apexpages.currentpage().getparameters().get('conlst');
         acc=[select id,name,(select id,lastname from contacts) ,(select name from Opportunities ) from account where id=:getid ];
            system.debug(acc);
        return null;
   
    }
    public void newmeth()
    {
        if(person==true){
            business=false;
        }
    }
    public void meth()
    {
        if(business==true){
            person=false;
        }
  
    }
    public PageReference  save()
    {
        //acc=new account();
        system.debug('Account'+acc);
       insert acc;
       PageReference pg = new PageReference('/apex/accoountdetail?id='+acc.id);
       pg.setRedirect(true);
    return pg;
    }}