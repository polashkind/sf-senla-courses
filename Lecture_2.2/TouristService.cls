public class TouristService {
    
    public static void markDuplicates(List<Tourist__c> newTourists) {
        List<Tourist__c> existingTourists = TouristManagerCustom.getByEmailLastName();
        
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
}