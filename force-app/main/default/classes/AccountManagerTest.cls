/**
 * @description       : 
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             : 
 * @last modified on  : 10-11-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
**/
@IsTest
private class AccountManagerTest{
    @isTest static void testAccountManager(){
        Id recordId = getTestAccountId();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://curious-moose-c4d5ax-dev-ed.trailblaze.lightning.force.com/services/apexrest/Accounts/'+ recordId +'/Contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        // Call the method to test
        Account  acc = AccountManager.getAccount();
        
        // Verify results
        System.assert(acc != null);
    }
    
    private static Id getTestAccountId(){
        Account acc = new Account(Name = 'TestAcc2');
        Insert acc;
         
        Contact con = new Contact(LastName = 'TestCont2', AccountId = acc.Id);
        Insert con;
        
        return acc.Id;
    }
}
