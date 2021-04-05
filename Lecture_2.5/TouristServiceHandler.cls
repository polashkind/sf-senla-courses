public class TouristServiceHandler {

    public static Boolean isFirstTime = true;
    
	@future
    public static void markDuplicates(Set<Id> touristIds) {
        if (touristIds == null || touristIds.isEmpty()) return;

        Set<String> newEmails = new Set<String>();
        Set<String> newNames = new Set<String>();
        
        List<Tourist__c> newTourists = TouristManager.getTouristsByIds(touristIds);
        
        for (Tourist__c tourist : newTourists) {
            newEmails.add(tourist.Email__c);
            newNames.add(tourist.Tourist_Last_Name__c);
        }

        List<Tourist__c> existingTourists = TouristManager.getByEmailAndLastName(newNames, newEmails);
        
        for (Tourist__c newTourist : newTourists) {
            for (Tourist__c existingTourist : existingTourists) {
                if (
                    !String.isBlank(newTourist.Tourist_Last_Name__c)
                    && !String.isBlank(newTourist.Email__c)
                    && newTourist.Tourist_Last_Name__c == existingTourist.Tourist_Last_Name__c 
                    && newTourist.Email__c == existingTourist.Email__c
                ) {
                    newTourist.IsDuplicate__c = true;
                }
            }
        }

        update newTourists;
    }
  
    public static void flightStatusDeclined(List<Tourist__c> newTourists) {
        if (newTourists == null || newTourists.isEmpty()) return;

        Set<Id> inactiveTouristsIds = new Set<Id>();
        for (Tourist__c tourist : newTourists) {
            if (!tourist.Is_Active__c) {
                inactiveTouristsIds.add(tourist.Id);
            }
        }
        
        List <Flight__c> flights = FlightManager.getFlights(inactiveTouristsIds);

        for (Flight__c flight : flights) {
            flight.Tourist_Status__c = Constants.FLIGHT_STATUS_DECLINED;
        }
        update flights;
    }
}