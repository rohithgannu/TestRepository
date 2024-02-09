public class test3 {
   
    public static void method()
    {
     Map<String, Integer> merMap = New Map<String, Integer>();
     List<Line_Item__c> lstLin = [Select id,Name,Unit_price__c, Merchandise__r.Price__c from Line_Item__c];
     List<Merc__c> LIRec = [SELECT Id,Name,(select name,Unit_Price__c from Merc__c.line_item__r) FROM     Merc__c];
     {
         for(Merc__c l : LIRec){
              merMap.put(l.Id,l.line_item__r.size());
             system.debug('Line Item Size '+l.id+' ' + l.name +' '+ l.line_item__r.size());   
             }
         
         for(Line_Item__c i : lstLin)
            {
                if(merMap.containsKey(i.id)){
                   i.Unit_price__c = i.Merchandise__r.Price__c / merMap.get(i.id);
                  }
                 
            }   Update lstLin;
      }    
   }
}