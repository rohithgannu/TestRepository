trigger contacttrigger on Contact (after insert,after update) {
    set<Id> idList = new set<Id>();
List<Account> accList = new List<Account>();
for(Contact con: Trigger.new){

idList.add(con.AccountId);
}
List<Account> accList1= new list<Account>([Select Id,Rollup_Amount_X__c,Rollup_Amount_Y__c,(Select Id,Amount_X__c, Amount_Y__c, Type__c from Contacts) from Account where Id in:idList]);

for(Account acc: accList1){
Decimal amountx=0;
Decimal amounty=0;
for(Contact con: acc.Contacts){

if(con.Type__c=='Positive'){
amountx =amountx+con.Amount_X__c;
}
    else if(con.Type__c=='negative'){

amounty=amounty+con.Amount_Y__c;
}
}
acc.Rollup_Amount_X__c = amountx;
acc.Rollup_Amount_Y__c = amounty;
accList.add(acc);
}

update accList;
}