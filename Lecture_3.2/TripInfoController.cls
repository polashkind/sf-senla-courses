public with sharing class TripInfoController {
    public Trip__c trip;
    
    public List<Tourist__c> notRelatedTourists;
    public List<Tourist__c> getNotRelatedTourists() {
        return this.notRelatedTourists;
    }
    
    public TripInfoController(ApexPages.StandardController stdController) {
        this.trip = (Trip__c)stdController.getRecord();
        this.notRelatedTourists = getNotRelatedTourists(trip.Id);
    }
    
    private List <Tourist__c> getNotRelatedTourists(String tripId) {
        return [
            SELECT Name,
            	Birthdate__c,
            	Age__c,
            	Email__c
            FROM Tourist__c
            WHERE Id NOT IN 
            (
            SELECT Tourist__c
                FROM Flight__c
                WHERE Trip__c != :tripId
            )
        ];
    }
 }