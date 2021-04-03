public class FlightTriggerHandler {

    public static Boolean isFirstTime = true;

    public static void onBeforeInsert(List<Flight__c> newFlights) {
        List<Flight__c> flights = FlightManager.flights();
        
        for (Flight__c newFlight : newFlights) {
            if (newFlight.Tourist__r.Age__c < newFlight.Trip__r.Minimum_Age__c) {
                newFlight.addError(Constants.ERROR_LEGAL_AGE_FOR_FLIGHT);
            }
            if (newFlight.Status__c == 'Upcoming' || newFlight.Trip__r.Start_Date__c < date.today()) {
                newFlight.addError(Constants.ERROR_SHIP_DEPARTED);
            }
        }
    }
}