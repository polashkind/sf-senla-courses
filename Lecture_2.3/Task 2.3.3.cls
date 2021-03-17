public class TouristAgeTriggerHandler {
    public static void onBeforeInsert(List<Flight__c> newFlights) {
        List<Flight__c> flightAge = [
            SELECT Tourist__r.Age__c,
                    Trip__r.Minimum_Age__c,
                    Trip__r.Start_Date__c,
            		Status__c
            FROM Flight__c
        ];
        
        for (Flight__c newFlight : newFlights) {
            if (newFlight.Tourist__r.Age__c < newFlight.Trip__r.Minimum_Age__c) {
                newFlight.addError('You are less than the legal age for flying');
            }
            if (newFlight.Status__c == 'Upcoming' || newFlight.Trip__r.Start_Date__c < date.today()) {
                newFlight.addError('The ship has already departed');
            }
        }
    }
}