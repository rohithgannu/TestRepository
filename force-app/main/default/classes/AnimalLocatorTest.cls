@isTest
private class AnimalLocatorTest {

   @isTest
   static void testmethod1(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
         String res = AnimalLocator.getAnimalNameById(1);
         System.assertEquals('majestic badger', res);
         
    }
}