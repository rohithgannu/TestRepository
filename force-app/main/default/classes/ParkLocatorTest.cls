@isTest
private class ParkLocatorTest{
    
    @isTest static void testCallout(){
        
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        List<String> park = new List<String>();
        String x ='Park1';
        park.add(x);
        
        String y='Park2';
        park.add(y);
        
        string z ='Park3';
        park.add(z);
        
        System.debug('park'+park);
        
        List<String> result =  ParkLocator.country('India');
        System.debug('result'+result);
        System.assertEquals(park,result);
    }

}