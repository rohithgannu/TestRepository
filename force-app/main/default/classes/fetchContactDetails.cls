public class fetchContactDetails {
    @AuraEnabled

    public static list<Contact> fetchContactList2(){

        return [select Id, name from  contact limit 10];             

    }

}