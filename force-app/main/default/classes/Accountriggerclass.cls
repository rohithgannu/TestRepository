public class Accountriggerclass {
    public static void method(List<Account> a){
         list<Account> list1=new list<Account>();
    for(account ac:a){
        if(ac.Industry=='Agriculture')
        {
            ac.Rating='Hot';
           
        }
        else if(ac.Industry=='Consulting')
        {
            ac.Rating='Warm';
            
        }
        else if(ac.Industry=='Electronics')
        {
            ac.Rating='Cold';
            
        }
        else{ 
            ac.rating=null;
                            
        }
        
        
        list1.add(ac);
       
    }
        

}
}