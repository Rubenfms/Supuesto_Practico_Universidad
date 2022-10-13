/**
 * @description       :
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             :
 * @last modified on  : 10-10-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
 **/
public with sharing class ContactTriggerHandler {
	public static void createNewOpportunity(List<Contact> contactList) {
		List<Opportunity> oppList = new List<Opportunity>();

		for (Contact c : contactList) {
			if (estudioExists(c.Estudio__c)) {
				Opportunity opp = new Opportunity(
					Name = (c.Estudio__c != null) ? c.LastName + ' ' + c.Estudio__C : c.LastName,
					CloseDate = Date.newInstance(2023, 1, 1),
					StageName = 'Prospecting',
					Amount = 20000,
					Alumno__c = c.Id
				);
				oppList.add(opp);
			}
		}
		if (oppList.size() > 0)
			insert oppList;
	}

    public static Boolean estudioExists(String estudio) {

        Set<String> pickListValues = new Set<String>();

        Schema.DescribeFieldResult fieldResult = Contact.Estudio__C.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValues.add(pickListVal.getLabel());
        }  

        if(String.isBlank(estudio) || String.isEmpty(estudio)) {
            return false;
        }
        else if(!pickListValues.contains(estudio)) {
            return false;
        }
        else return true;
    }
	public static void checkEmail(List<Contact> contactList) {
		Set<String> emailList = new Set<String>();
		for (Contact c : contactList) {
			emailList.add(c.Email);
		}

		Map<Id, Contact> contactMap = new Map<Id, Contact>([SELECT Id, Email FROM Contact WHERE Email IN :emailList]);

		Set<String> duplicatedEmailList = new Set<String>();
		for (Id key : contactMap.keySet()) {
			duplicatedEmailList.add(contactMap.get(key).Email);
		}

		for (Contact c : contactList) {
			if (duplicatedEmailList.contains(c.Email)) {
				c.Email.addError('Ya existe un registro con este email en la BD.');
			}
		}
	}
}