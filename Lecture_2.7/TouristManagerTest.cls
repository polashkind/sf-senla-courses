@isTest
private class TouristManagerTest {
    @testSetup static void setup() {
        List<Tourist__c> touristToInsert = TestDataFactory.createTourists();
        insert touristToInsert;
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
}