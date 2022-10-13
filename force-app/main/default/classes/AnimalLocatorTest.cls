/**
 * @description       : 
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             : 
 * @last modified on  : 10-10-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
**/
@isTest
private class AnimalLocatorTest 
{
    static testMethod void testMethod1() 
    {
        // Set mock callout class 
	    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
	    
	    // This causes a fake response to be sent
	    // from the class that implements HttpCalloutMock. 
	    String str = AnimalLocator.getAnimalNameById(1);
	    
    }
}