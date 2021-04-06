public class FlightTriggerHandler {

    public static Boolean isFirstTime = true;

    public static void onBeforeInsert(List<Flight__c> newFlights) {
        
        Set<Id> tripIds = new Set<Id>();
        Set<Id> touristIds = new Set<Id>();
        
        for (Flight__c flight : newFlights) {
            tripIds.add(flight.Trip__c);
            touristIds.add(flight.Tourist__c);
        }
        
        List<Trip__c> trips = TripManager.getByIds(tripIds);
        Map<Id, Trip__c> tripMap = new Map<Id, Trip__c>(trips);
        
        List<Tourist__c> tourists = TouristManager.getByIds(touristIds);
        Map<Id, Tourist__c> touristMap = new Map<Id, Tourist__c>(tourists);
        
        for (Flight__c flight : newFlights) {
            Tourist__c tourist = touristMap.get(flight.Tourist__c);
            Trip__c trip = tripMap.get(flight.Trip__c);
            
            if (tourist.Age__c < trip.Minimum_Age__c) {
                flight.addError(Constants.ERROR_LEGAL_AGE_FOR_FLIGHT);
            }
            if (flight.Status__c == 'Upcoming' || trip.Start_Date__c < date.today()) {
                flight.addError(Constants.ERROR_SHIP_DEPARTED);
            }
        }
    }
}