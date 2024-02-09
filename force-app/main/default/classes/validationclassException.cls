public class validationclassException extends Exception{
    public void method(string para){
        Account a=new Account();
        a.Name=para;
       try{
            if(para.contains('test'))
            {
                insert a;
            }
           else throw new validationclassException('exception occured');
        }
        catch(validationclassException e)
        {
            System.debug(e.getmessage());
        }
        
    }
    
}