public class NewCaseListController{
    public List<Case> getNewCases(){
        List<Case> cas=new List<Case>();
        
      
        cas=[Select Id,CaseNumber from Case Where Status='New'];
        System.debug(cas);
         
       
        return cas;
    }

}