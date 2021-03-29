public class TouristService {

    public static void markDuplicates(List<Tourist__c> newTourists) {
        List<Tourist__c> existingTourists = TouristManager.getByEmailLastName();
        
        for (Tourist__c newTourist : newTourists) {
            for (Tourist__c existingTourist : existingTourists) {
                if (
                    !String.isBlank(newTourist.Tourist_Last_Name__c)
                    && !String.isBlank(newTourist.Email__c)
                    && newTourist.Tourist_Last_Name__c == existingTourist.Tourist_Last_Name__c 
                    && newTourist.Email__c == existingTourist.Email__c
                ) {
                    newTourist.IsDuplicate__c = true;
                }
            }
        }
            
        update newTourists;
    }
  
    public static void flightStatusDeclined(List<Tourist__c> newTourists) {
        Tourist__c newTourist = newTourists[0];
        List<Flight__c> flights = TouristManager.getByStatus();
        
        for (Tourist__c newTourist : newTourists) {
            if (!newTourist.Is_Active__c) {
                for (Flight__c flight : flights) {
                    flight.Tourist_Status__c = 'Declined';
                }
            
                update flights;
            }
        }
    }
}