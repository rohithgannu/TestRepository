public class EmailUpdateClass {
    public static void  mail(list<contact> con){
        set<Id> setid=new set<Id>();
        for(contact cv:con){
            setid.add(cv.AccountId);
        }
    Map<id,Account> mapid=new map<id,Account>([select id,Email__c from Account where id IN:setid]);
    for(contact cv:con){
        cv.Email =mapid.get(cv.AccountId).Email__c;
    }
    }

}