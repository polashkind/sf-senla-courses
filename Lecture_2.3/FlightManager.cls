public class FlightManager {

  public static List<Flight__c> getFlights(){
    List<Flight__c> searchStatusForFlight = [
        SELECT Tourist_Status__c,
                Trip__r.Start_Date__c,
                Tourist__r.Is_Active__c
        FROM Flight__c
    ];
    return searchStatusForFlight;
  }

  public static List<Flight__c> flights(){
    List<Flight__c> searchFlightAge = [
          SELECT Tourist__r.Age__c,
                  Trip__r.Minimum_Age__c,
                  Trip__r.Start_Date__c,
                  Status__c
          FROM Flight__c
    ];
    return searchFlightAge;
  }
}