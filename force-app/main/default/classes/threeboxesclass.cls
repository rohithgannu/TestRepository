public with sharing class threeboxesclass {

    public threeboxesclass(ApexPages.StandardController controller) {

    }

   public String searchindustry { get; set; }
   public String searchtype { get; set; }
   public String searchname { get; set; }
   public list <Account> acc {get;set;}
   Public string selectedname{get;set;}
   
   public void search(){
       string searchquery='select Id,Name,Industry,Type from account where name like \'%'+searchname+'%\'AND (Industry like \'%'+searchindustry+'%\' AND Type like \'%'+searchtype+'%\') Limit 10';
       acc= Database.query(searchquery);
   }

   public void clear(){
       acc.clear();
   }
}