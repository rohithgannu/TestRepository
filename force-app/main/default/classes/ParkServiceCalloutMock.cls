@isTest
global class ParkServiceCalloutMock implements WebServiceMock {
    
    global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType){
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
       List<String> myStrings = new List<String> {'Park1','Park2','Park3'};
        System.debug('myStrings'+myStrings);
        response_x.return_x = myStrings;
       response.put('response_x', response_x);  
               system.debug('park'+response_x);
    }

}