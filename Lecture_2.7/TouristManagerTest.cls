@isTest
private class TouristManagerTest {
    @testSetup 
    static void setup() {
        List<Tourist__c> touristToInsert = TestDataFactory.createTourists();
        insert touristToInsert;
        List<Trip__c> tripToInsert = TestDataFactory.createTrips();
        insert tripToInsert;
    }
	
    @isTest
    static void testGetByName() {
        List<Tourist__c> filteredTourists = TouristManager.getByName('Polly');
        
        System.assertEquals(1, filteredTourists.size());
    }
	
    @isTest
    static void testGetByAge() {
        List<Tourist__c> filteredTourists = TouristManager.getByAge(7);

        System.assertEquals(1, filteredTourists.size());
    }
    
    @isTest
    static void testGetByTripById() {
        List<Trip__c> trips = [SELECT Id FROM Trip__c];
        Set<Id> tripIds = new Set<Id>();
        for (Trip__c trip : trips) {
            tripIds.add(trip.Id);
        }

        List<Trip__c> filteredTrip = TripManager.getByIds(tripIds);

        System.assertEquals(3, filteredTrip.size());
    }
}