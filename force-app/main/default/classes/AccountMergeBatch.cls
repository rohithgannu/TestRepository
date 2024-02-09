global class AccountMergeBatch implements Database.Batchable<sObject>, Database.Stateful {
    public String queryString;
    global Database.QueryLocator start(Database.BatchableContext BC) {
        queryString = 'SELECT Id, Name, Phone,CreatedDate FROM Account ORDER BY CreatedDate ASC';
        return Database.getQueryLocator(queryString);
    }
    global void execute(Database.BatchableContext BC, List<Account> scope) {
        
        System.debug('scope'+scope);
        Map<Account,List<Account>> accountMap = new Map<Account,List<Account>>();
        Set<String> accountName = new Set<String>();
        Set<String> accountPhone = new Set<String>();
        Set<String> accountType = new Set<String>();
        
        for(Account a :scope){
            accountName.add(a.Name.toLowerCase());
            accountPhone.add(a.Phone.toLowerCase());
        }
        
        //Get All non formula fields of account
        String sobjectApiName = 'Account';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
        List<String> fieleList = new List<String>();
        for(String fieldName : fieldMap.keySet()){
            Schema.DescribeFieldResult fieldResult = fieldMap.get(fieldName).getDescribe();
            if(!fieldResult.isCalculated() && fieldResult.isCreateable() && !fieldResult.isExternalId()){
                System.debug('yes');
                fieleList.add(fieldName);
            }
          
        }
        
        String fetchFields = 'SELECT '+String.join(fieleList,',')+' FROM '+sobjectApiName+' WHERE Name IN :accountName ORDER BY CreatedDate ASC limit 150';
        integer i = 1;
        for(Account a : Database.query(fetchFields)){
            Account key = new Account(
                Name=a.Name.toLowerCase(),
                Phone=a.Phone==null? null: a.Phone.toLowerCase(), 
                Type=a.Type==null? null: a.Type.toLowerCase() 
             );
            if(accountMap.containsKey(key)){
                accountMap.get(key).add(a);
            }else {
                accountMap.put(key,new List<Account>{a});
            }
            i++;
        }
        System.debug('i >'+i);
        System.debug('accountMap >> '+accountMap);
        List<Account> mergeList;
       /* for(String key : accountMap.keySet()){
            System.debug('Size >>'+ accountMap.get(key).size());
            if(accountMap.get(key).size()>1){
                mergeList = new List<Account>();
                Account masterAccount = accountMap.get(key)[0];
                mergeList.addAll(accountMap.get(key));
                mergeList.remove(0);
                System.debug('mergeList >> '+mergeList);
                for(Account a : mergeList){
                    Database.MergeResult mergeResult = Database.merge(masterAccount, a, true);
                }
            }
        }*/
        
        //if(mergeList.size()>0)
        //  update mergeList;
       for(Account[] accList: accountMap.values()) {
    Account master = accList.remove(0);
    Account[] dupes = new Account[0];
    System.debug('dupes'+dupes);       
    while(accList.size()>1) {
        System.debug('accList'+accList);  
        dupes.add(accList.remove(0));
        System.debug('dupes2'+dupes);       
        if(dupes.size() == 2) {
            Database.merge(master, dupes);
            dupes.clear();
        }
    }
    if(!dupes.isEmpty()) {
        Database.merge(master, dupes);
    }
}
        
    }
    
    global void finish(Database.BatchableContext BC) {
        
    }}