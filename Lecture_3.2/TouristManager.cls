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
   
    public static List<Tourist__c> getByFlight(Integer filterYear){
        List<Tourist__c> searchTouristByFlight = [
            SELECT Name, (SELECT Tourist__r.Name, 
                                Tourist__r.Age__c 
                          FROM Flights__r
                          WHERE CALENDAR_YEAR(Trip__r.Start_Date__c) >= :filterYear)
            FROM Tourist__c
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

    public static List<Tourist__c> getByEmailAndLastName(Set<String> newNames, Set<String> newEmails){
        List<Tourist__c> searchTouristByEmailLastName = [
            SELECT Tourist_Last_Name__c,
                    Email__c
            FROM Tourist__c
            WHERE Tourist_Last_Name__c = :newNames AND Email__c = :newEmails
        ];
        return searchTouristByEmailLastName;
    }
    
    public static List<Tourist__c> getTouristsByIds(Set<Id> touristIds){
        List<Tourist__c> tourists = [
            SELECT Tourist_Last_Name__c,
                    Email__c 
            FROM Tourist__c 
            WHERE Id IN :touristIds
        ];
        return tourists;
    }
    
    public static List<Tourist__c> getByIds(Set<Id> touristIds){
        List<Tourist__c> tourists = [
            SELECT Id, Age__c 
            FROM Tourist__c 
            WHERE Id IN :touristIds
        ];
        return tourists;
    }
    
    public static List<Tourist__c> getNotRelatedTourists(String tripId){
        List<Tourist__c> tourists = [
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
        return tourists;
    }
    
}