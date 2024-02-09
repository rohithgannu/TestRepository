public class condetails {
@AuraEnabled
    public static List<contact> condetails1()
    {
       list<contact> cont=[select FirstName,LastName from contact];
        return cont;
}
    
}