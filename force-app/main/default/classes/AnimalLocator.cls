/**
 * @description       : 
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             : 
 * @last modified on  : 10-10-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
**/
public with sharing class AnimalLocator 
{
    public static String getAnimalNameById(Integer num )
    {
    	String rvalue = '';

    	Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + String.valueOf(num));
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        HttpResponse response = http.send(request);
        System.debug('UAC: response ' + response.getBody() );
        //Items item = (Items) JSON.deserializeStrict(response.getBody(), AnimalLocator.Items.class );

        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        System.debug('UAC: results ' + results );

       	Map<String, Object> item =  (Map<String, Object>)results.get('animal') ;
        
       	System.debug('UAC: ' + (String) item.get('name'));

    	return (String) item.get('name') ;
    }
}