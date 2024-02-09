public class accountsclass {
@auraEnabled
public static list<account> getAllAccounts()
    {
       list<account> accs =[select id,name,LastModifiedById,phone,type,rating,website from account order by lastmodifieddate desc Limit 20];
      return accs;
    }
}