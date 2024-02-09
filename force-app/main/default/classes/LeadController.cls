public class LeadController{
    @AuraEnabled
 public static list <lead> fetchLead() {
  
   List<lead> returnListOfContact = new List<lead>();
  
     List <lead> lstOfcon = [Select Name,Phone,Status,NumberOfEmployees from Lead ];
  
     for(lead cc : lstOfcon){
         if(cc != null){
             returnListOfContact.add(cc);
         }
      }   
  
    return returnListOfContact ;
 }}