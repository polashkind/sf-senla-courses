@RestResource(urlMapping='/Tourist/*')
global with sharing class TouristRestService {

    @HttpGet
    global static List<Tourist__c> getTourists() {
    	Map<String, String> parameters = RestContext.request.params;

    	String fuzzyname = parameters.get('fuzzyname');
    	Decimal userAge = decimal.valueOf(parameters.get('age'));
            
       	List<Tourist__c> result = [
        	SELECT Id, Name
        	FROM Tourist__c
        	WHERE Name = :fuzzyname 
       		AND Age__c = :userAge
     	];
        
        RestResponse response = RestContext.response;
        response.statusCode = 200;
       
     	return result;
    } 
}