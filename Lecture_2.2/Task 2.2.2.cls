public class TouristManager {

    // выбрать туристов (имя, возраст) чье имя содержит Джон

    public static void viewTouristsByName(String filterName){
        List<Tourist__c> searchTouristByName = [SELECT Name, Age__c FROM Tourist__c WHERE Name = :filterName];
        for (Tourist__c con : searchTouristByName){
            String fullName = 'First Name: ' + con.Name + ', Age: ' + con.Age__c;
            system.debug(fullName);
        }
    }
    
    // выбрать туристов (имя, возраст) с возрастом 20, 22, 24 года

    public static void viewTouristsByAge(Integer filterAge){
        List<Tourist__c> searchTouristByAge = [SELECT Name, Age__c FROM Tourist__c WHERE Age__c = :filterAge];
        for (Tourist__c con : searchTouristByAge){
            String fullName = 'First Name: ' + con.Name + ', Age: ' + con.Age__c;
            system.debug(fullName);
        }
    }
   
    // выбрать туристов (имя, возраст), у которых рейс стартовал в 2020 году.

    public static void viewTouristsByFlight(Integer filterYear){
        List<Flight__c> searchTouristByFlight = [SELECT Tourist__r.Name, Tourist__r.Age__c FROM Flight__c WHERE CALENDAR_YEAR(Trip__r.Start_Date__c) >= :filterYear];
        for (Flight__c con : searchTouristByFlight){
            String fullName = 'First Name: ' + con.Tourist__r.Name + ', Age: ' + con.Tourist__r.Age__c;
            system.debug(fullName);
        }
    } 

    // выбрать туристов (имя, возраст) со списком рейсов (дата старта, название)
    
    public static void viewTouristsByFlightList(){
        List<Flight__c> searchTouristByFlightList = [SELECT Tourist__r.Name, Tourist__r.Age__c, Trip__r.Name, Trip__r.Start_Date__c FROM Flight__c];
        for (Flight__c con : searchTouristByFlightList){
            String fullName = 'First Name: ' + con.Tourist__r.Name + ', Age: ' + con.Tourist__r.Age__c;
            system.debug(fullName);
        }
    }

    // выбрать туристов (имя, возраст) которые не зарегистрировались ни на один рейс
    
    public static void viewTouristsNonFlight(){
        List<Tourist__c> searchTouristNonFlight = [SELECT Name, Age__c FROM Tourist__c WHERE Id NOT IN (SELECT Tourist__c FROM Flight__c)];
        for (Tourist__c con : searchTouristNonFlight){
            String fullName = 'First Name: ' + con.Name + ', Age: ' + con.Age__c;
            system.debug(fullName);
        }
    }
}