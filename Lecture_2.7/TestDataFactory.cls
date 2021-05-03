public class TestDataFactory {
    
    public static List<Tourist__c> createTourists() {
        List<Tourist__c> touristToInsert = new List<Tourist__c> {
            new Tourist__c(Name = 'Alex', Birthdate__c = date.valueOf('1991-07-28')),
            new Tourist__c(Name = 'Polly', Birthdate__c = date.valueOf('1990-05-06')),
            new Tourist__c(Name = 'Max', Birthdate__c = date.valueOf('2014-08-26'))    
        };
            
        return touristToInsert;
    }

}