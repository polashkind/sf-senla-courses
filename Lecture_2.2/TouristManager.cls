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

    public static List<Tourist__c> getByFlightList(){
        List<Tourist__c> searchTouristByFlightList = [
            SELECT Name,
                   Age__c, 
                   (SELECT  Trip__r.Name, Trip__r.Start_Date__c 
                   FROM Flights__r)
            FROM Tourist__c
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

    public static List<Tourist__c> getByEmailLastName(sObject newTourist){
        
        List<Tourist__c> searchTouristByEmailLastName = [
            SELECT Tourist_Last_Name__c,
                    Email__c
            FROM Tourist__c
            WHERE Tourist__c.Tourist_Last_Name__c = :newTourist.Tourist_Last_Name__c 
                    && Tourist__c.Email__c = :newTourist.Email__c
        ];
        return searchTouristByEmailLastName;
    }

    public static List<Tourist__c> getByStatus(sObject newTourist){
    List<Tourist__c> searchStatusForFlight = [
           SELECT Name, (SELECT Tourist_Status__c,
                    Trip__r.Start_Date__c,
                    Tourist__r.Is_Active__c
                    FROM Flights__r
                    WHERE Tourist__c = :newTourist.Id)
        	FROM Tourist__c
        ];
        return searchStatusForFlight;
    }
}