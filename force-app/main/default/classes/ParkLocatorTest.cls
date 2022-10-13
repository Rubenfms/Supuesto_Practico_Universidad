/**
 * @description       : 
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             : 
 * @last modified on  : 10-10-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
**/
@isTest
private class ParkLocatorTest{
    @isTest 
    static void testParkLocator() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] arrayOfParks = ParkLocator.country('India');
        
        System.assertEquals('Park1', arrayOfParks[0]);
    }
}