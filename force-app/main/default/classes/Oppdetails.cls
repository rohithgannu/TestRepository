public class Oppdetails {
     @AuraEnabled
    public static list<Opportunity> oppdetails(){
        list<Opportunity> ac=[select Name,AccountId,Type,Probability from Opportunity];
        return ac;
    }
    

}