/**
 * @description       : 
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             : 
 * @last modified on  : 10-10-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
**/
public with sharing class OpportunityTriggerHandler {
    public static void stageChangedToAdmision(List<Opportunity> oppList) {

        Map<Id, Contact> viaDeAccesoMap = new Map<Id,Contact>([SELECT Id, Via_de_Acceso__c FROM Contact WHERE Via_de_Acceso__c != null]);

        for(Opportunity opp : oppList) {
            if(opp.StageName == 'Admisión' && opp.ContactId != null) {
                Maestro_Documentacion__c maestroDocumentacion = new Maestro_Documentacion__c(Estudio__c = opp.Estudio__c, 
                                                                                             Via_de_Acceso__c = viaDeAccesoMap.get(opp.ContactId).Via_de_Acceso__c);

                Solicitud_de_Documetacion__c solicitudDocumentacion = new Solicitud_de_Documetacion__c(Maestro_Documentacion__c = maestroDocumentacion.Id, 
                                                                      Estado__c = 'Pendiente entrega',
                                                                      Admision__c = opp.Id);
             // todo: crear un solicitud doc mocckup a ver si funciona                                                                                          Admision__c = opp.Id);
            }
        }
    }
}