public class class12 {
    public void method(){
        Account acc= new Account(Name='Test Account');
        Insert acc;
        Id accID= acc.Id;
      Opportunity opp=new Opportunity(
            AccountId=accID,
             Name='opp1',
        StageName='closed',
        closeDate=Date.parse('10/14/2017'));
            Insert opp;
        System.debug('name='+opp.Name+'Account Name='+acc.Name+'opportunity stage='+opp.StageName);
         }
    }