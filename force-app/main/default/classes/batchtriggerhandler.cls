public class batchtriggerhandler {
    public static void m(list<batch__c> batch1){
        set<string> setid=new set<string>();
        for(batch__c bat:batch1){
            setid.add(bat.comapanyName__c);
        }
        map<String,Account> mapid =new map<string,Account>();
        list<Account> acc=[select Name from Account where Name in:setid ];
            for(Account a:acc){
                mapid.put(a.Name,a);
            }
        for(batch__c bat:batch1){
            if(mapid.containsKey(bat.comapanyName__c))
            {
                bat.Account__c=mapid.get(bat.comapanyName__c).id;
            }
            else bat.Account__c=null;
        }
    }
}