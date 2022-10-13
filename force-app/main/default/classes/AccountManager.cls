/**
 * @description       : 
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             : 
 * @last modified on  : 10-11-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
**/
@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager{
    @HttpGet
    global static Account getAccount(){
        RestRequest req = RestContext.request;
        String accId = req.requestURI.substringBetween('Accounts/', '/contacts');
        Account acc = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) 
                       FROM Account WHERE Id = :accId LIMIT 1];
        
        return acc;
    }
}