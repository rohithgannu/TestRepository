public class AnimalLocator {
    
    public static string getAnimalNameById(Integer id){
        Http h =new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        String returnValue = NULL;
        if (res.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            system.debug(results);
            // Cast the values in the 'animals' key as a list
          Map<String, Object> animalMap = (Map<String, Object>) results.get('animal');
            System.debug('animalMap'+animalMap);
            returnValue = (String) animalMap.get('name');                 
        }
        
       return returnValue;
    }
}