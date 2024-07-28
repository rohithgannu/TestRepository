public with sharing class ContactExp {
    @AuraEnabled(cacheable=true)
    public static List<contact> getContactList(string recordId) {
       List<contact> conList= [SELECT Id, Name, Title, Phone, Email FROM Contact  where AccountId=:recordId LIMIT 10];
        return conList;
    }
    @AuraEnabled(cacheable=true)
    public static List<contact> getContactListNew() {
       List<contact> conList= [SELECT Id, FirstName,LastName, Title, Phone, Email FROM Contact LIMIT 100];
        return conList;
    }
}