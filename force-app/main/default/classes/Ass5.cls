public class Ass5 {
    public string method(String x){
        if(x==null)
        {
            return null;
        }
        else if(x.contains('Test')){
            return 'true';
        }
        else if(x=='salesforce'){
            return 'true';
        }
        else return 'false';
    }

}