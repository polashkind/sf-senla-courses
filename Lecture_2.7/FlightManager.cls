public class FlightManager {

  public static List<Flight__c> getFlights(Set<Id> inactiveTouristsIds){
    List<Flight__c> searchStatusForFlight = [
        SELECT Tourist_Status__c,
                Trip__r.Start_Date__c,
                Tourist__r.Is_Active__c
        FROM Flight__c
    ];

    return searchStatusForFlight;
  }

}