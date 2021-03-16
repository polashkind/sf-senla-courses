public class TouristManager {

    // выбрать туристов (имя, возраст) чье имя содержит Джон

    public static List<Tourist__c> getByName(String filterName){
        List<Tourist__c> searchTouristByName = [
            SELECT Name, Age__c 
            FROM Tourist__c 
            WHERE Name = :filterName
        ];
        return getByName;
    }
    
    // выбрать туристов (имя, возраст) с возрастом 20, 22, 24 года

    public static List<Tourist__c> getByAge(Integer filterAge){
        List<Tourist__c> searchTouristByAge = [
            SELECT Name, Age__c 
            FROM Tourist__c 
            WHERE Age__c = :filterAge
        ];
        return getByAge;
    }
   
    // выбрать туристов (имя, возраст), у которых рейс стартовал в 2020 году.

    public static List<Flight__c> getByFlight(Integer filterYear){
        List<Flight__c> searchTouristByFlight = [
            SELECT Tourist__r.Name, 
                   Tourist__r.Age__c 
            FROM Flight__c 
            WHERE CALENDAR_YEAR(Trip__r.Start_Date__c) >= :filterYear
        ];
        return getByFlight;
    }

    // выбрать туристов (имя, возраст) со списком рейсов (дата старта, название)
    
    public static List<Flight__c> getByFlightList(){
        List<Flight__c> searchTouristByFlightList = [
            SELECT Tourist__r.Name, 
                   Tourist__r.Age__c, 
                   Trip__r.Name, 
                   Trip__r.Start_Date__c 
            FROM Flight__c
        ];
        return getByFlightList;
    }

    // выбрать туристов (имя, возраст) которые не зарегистрировались ни на один рейс
    
    public static List<Tourist__c> getByNonFlight(){
        List<Tourist__c> searchTouristNonFlight = [
            SELECT Name, Age__c 
            FROM Tourist__c 
            WHERE Id NOT IN (SELECT Tourist__c FROM Flight__c)
        ];
        return getByNonFlight;
    }
}