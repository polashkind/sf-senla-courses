@RestResource(urlMapping='/Tourist/*')
global with sharing class TouristRestService {

    @HttpGet
    global static List<Tourist__c> getTourists() {
    	Map<String, String> parameters = RestContext.request.params;

    	String fuzzyname = parameters.get(Constants.FUZZY_NAME);
    	Decimal userAge = decimal.valueOf(parameters.get(Constants.AGE));
            
       	List<Tourist__c> result = [
        	SELECT Id, Name
        	FROM Tourist__c
        	WHERE Name = :fuzzyname 
       		AND Age__c = :userAge
     	];
        
        RestResponse response = RestContext.response;
        response.statusCode = Constants.STATUS_CODE;
       
     	return result;
    } 
}