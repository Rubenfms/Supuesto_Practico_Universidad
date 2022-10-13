/**
 * @description       : 
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             : 
 * @last modified on  : 10-10-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
**/
trigger ContactTrigger on Contact (before insert, before update, after update, after insert) {

    
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            ContactTriggerHandler.checkEmail(Trigger.New);
        }
    }
    else {
        if(Trigger.isInsert){
            ContactTriggerHandler.createNewOpportunity(Trigger.New);
        }
    }
}