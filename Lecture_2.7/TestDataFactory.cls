public class TestDataFactory {
    private static Tourist__c touristFactory(String name, String birthdate, String email) {
        return new Tourist__c(Name = name, Birthdate__c = date.valueOf(birthdate), Email__c = email);
    }
    
    public static List<Tourist__c> createTourists() {
        List<Tourist__c> touristToInsert = new List<Tourist__c> {
            touristFactory('Alex', '1991-07-28', 'a@mail.ru'),
            touristFactory('Polly', '1990-05-06', 'p@mail.ru'),
            touristFactory('Max', '2014-08-26', 'm@mail.ru'),)    
        };
            
        return touristToInsert;
    }
    
    public static List<Trip__c> createTrips() {
        List<Trip__c> tripToInsert = new List<Trip__c> {
            new Trip__c(Minimum_Age__c = 10, Start_Date__c = date.valueOf('2022-04-28')),
            new Trip__c(Minimum_Age__c = 15, Start_Date__c = date.valueOf('2023-12-04')),
            new Trip__c(Minimum_Age__c = 4, Start_Date__c = date.valueOf('2030-03-02'))    
        };
            
        return tripToInsert;
    }
    
    public static List<Flight__c> createFlights() {
        List<Flight__c> flightToInsert = new List<Flight__c> {
               
        };
            
        return flightToInsert;
    }

}