public class TouristManager {
    
    public static List<Tourist__c> getByName(String filterName){
        List<Tourist__c> searchTouristByName = [
            SELECT Name, Age__c 
            FROM Tourist__c 
            WHERE Name = :filterName
        ];
        return searchTouristByName;
    }
    
    public static List<Tourist__c> getByAge(Integer filterAge){
        List<Tourist__c> searchTouristByAge = [
            SELECT Name, Age__c 
            FROM Tourist__c 
            WHERE Age__c = :filterAge
        ];
        return searchTouristByAge;
    }
   
    public static List<Flight__c> getByFlight(Integer filterYear){
        List<Flight__c> searchTouristByFlight = [
            SELECT Tourist__r.Name, 
                   Tourist__r.Age__c 
            FROM Flight__c 
            WHERE CALENDAR_YEAR(Trip__r.Start_Date__c) >= :filterYear
        ];
        return searchTouristByFlight;
    }

    public static List<Flight__c> getByFlightList(){
        List<Flight__c> searchTouristByFlightList = [
            SELECT Tourist__r.Name, 
                   Tourist__r.Age__c, 
                   Trip__r.Name, 
                   Trip__r.Start_Date__c 
            FROM Flight__c
        ];
        return searchTouristByFlightList;
    }

    public static List<Tourist__c> getByNonFlight(){
        List<Tourist__c> searchTouristNonFlight = [
            SELECT Name, Age__c 
            FROM Tourist__c 
            WHERE Id NOT IN (SELECT Tourist__c FROM Flight__c)
        ];
        return searchTouristNonFlight;
    }
}