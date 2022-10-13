/**
 * @description       : 
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             : 
 * @last modified on  : 10-07-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
**/
@isTest
public with sharing class ContactTriggerTest {

    @isTest(SeeAllData=True)
    public static void createNewOpportunityTest() {
        Contact c = new Contact(LastName = 'dsds');


        Test.startTest();

        insert c;

        Test.stopTest();
    }
}