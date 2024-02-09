public class testController
{

    public String checkphone { get; set; }

    public String checkEmail { get; set; }
    public String email { get; set; }
    public string phone{get;set;}
    public void checkEmail()
    {
        if(!Pattern.matches('[a-zA-Z0-9._-]+@[a-zA-Z]+.[a-zA-Z]{2,4}[.]{0,1}[a-zA-Z]{0,2}', email))
        {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Check your email')); 
        }
    }
    public void checkphone()
    {
        String phone = '9999999999';

if(!Pattern.matches('[0-9]{10}', phone)) {     
    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Check your phone number')); 
   
}
    }
}