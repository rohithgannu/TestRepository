@isTest
public class WarehouseCalloutServiceTest {
    // implement your mock callout test here
    @isTest
    static void testWareHouseCallout(){
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        WarehouseCalloutService.runWarehouseEquipmentSync();
    }
}