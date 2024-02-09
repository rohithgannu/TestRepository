public class Samplehandler {

       public static void accountlistMethod(List<Account> triggerNewList){
          Map<String, List<Account>> vendorAccountsToMerge = new Map<String, List<Account>>();
          for (Account account : triggerNewList) {
              
           List<Account> accountsToMerge = vendorAccountsToMerge.get(account.Name);
			
			if (accountsToMerge == null) {
				accountsToMerge = new List<Account>();
				vendorAccountsToMerge.put(account.Name, accountsToMerge);
			}
			
			if (accountsToMerge.size() < 2) {
				accountsToMerge.add(account);
			} else {
				
				// Merges takes up to two records to merge with the master
				// https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_database.htm
				System.debug('Maximum of accounts to merge reached.');
			}
            
        }
           
               List<account> dupacc = new list<account>();
                Account masterAccount;
				List<Id> duplicatedAccounts = new List<Id>();	
                Account candidateMasterAccount = null;
        for (String vendorCode : vendorAccountsToMerge.keySet()) {
			
			List<Account> accountsToMerge = vendorAccountsToMerge.get(vendorCode);
			
            if (accountsToMerge.size() > 1) {  
			
						
              
                for (Account account : accountsToMerge) {
					
                  if (candidateMasterAccount == null || account.CreatedDate < candidateMasterAccount.CreatedDate) {
                    candidateMasterAccount = account;
                }
                        duplicatedAccounts.add(account.Id);
                    }
                System.debug('***Master account*** ' + masterAccount);
                System.debug('***Duplicated accounts*** ' + duplicatedAccounts);
                }
                
                
                Database.MergeResult[] results = Database.merge(candidateMasterAccount, duplicatedAccounts, false);
                
                System.debug('***results merged** ' + results);
                
                for (Database.MergeResult res : results) {
                    if (res.isSuccess()) {
                        System.debug('Master record ID: ' + res.getId());
                        System.assertEquals(masterAccount.Id, res.getId());               
                        List<Id> mergedIds = res.getMergedRecordIds();
                        System.debug('IDs of merged records: ' + mergedIds);                	   
                    } else {
                        for (Database.Error err : res.getErrors()) {
                            System.debug(err.getMessage());
                        }
                    }						
                }                
			}
        }
      
}