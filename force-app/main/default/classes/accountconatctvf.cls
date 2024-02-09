public with sharing class accountconatctvf {
private ApexPages.StandardController controller; 
    public account acc;
    public accountconatctvf(ApexPages.StandardController controller) {
        this.controller=controller;

    }

    
   
    public list<account> accList{get;set;}
    public Pagereference showall(){
        id recordid=controller.getId();
       acclist=[select id,Name,(select name from contacts) from account where id=:recordid];
        return null;
    }

}