/**
 * @description       : 
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             : 
 * @last modified on  : 10-07-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
**/
trigger OpportunityTrigger on Opportunity (before insert, before update, after update) {
    if(Trigger.isBefore) {

    }
    else {
        if(Trigger.isUpdate) {
            OpportunityTriggerHandler.stageChangedToAdmision(Trigger.New);
        }
    }
}