public class deadaccount{
public static void DeadAccount1(List<Contact> conlist){
        integer i=0;
        integer per = 0;
        integer cSize = 0;
        Set<id> conIds = new set<id>();
        for(Contact c:conlist){
            conIds.add(c.AccountId);
        }
        List<Account> acList = [Select id,name,Need_intel__c from Account where id in:conIds];
        system.debug('account : '+acList);
        List<Account> upacList = new List<Account>();
        for(Account a:acList){
            for(Contact c1:conlist){
                if(c1.dead__c ==true){
                    i++;
                }
        }
            cSize = conlist.size();
            per = (i*100)/cSize;
            if(per >= 70){
                a.Need_intel__c = true;
                upacList.add(a);
            }else{
                a.Need_intel__c = false;
                upacList.add(a);
            }
        }
        update upacList;
    }

}