public class TouristTriggerHandler {

    public static Boolean isFirstTime = true;

    public static void markDuplicates(List<Tourist__c> tourists) {
        Set<Id> touristIds = new Set<Id>();
                
        for (Tourist__c tourist : tourists) {
            touristIds.add(tourist.Id);
        }

        TouristTriggerHandler.markDuplicatesAsync(touristIds);
    }
    
    @future
    private static void markDuplicatesAsync(Set<Id> touristIds) {
        if (touristIds == null || touristIds.isEmpty()) return;

        Set<String> newEmails = new Set<String>();
        Set<String> newNames = new Set<String>();
        
        List<Tourist__c> newTourists = TouristManager.getByIds(touristIds);
        
        for (Tourist__c tourist : newTourists) {
            newEmails.add(tourist.Email__c);
            newNames.add(tourist.Tourist_Last_Name__c);
        }

        List<Tourist__c> existingTourists = TouristManager.getByEmailAndLastName(newNames, newEmails);
        
        for (Tourist__c newTourist : newTourists) {
            for (Tourist__c existingTourist : existingTourists) {
                if (
                    !String.isBlank(newTourist.Tourist_Last_Name__c)
                    && !String.isBlank(newTourist.Email__c)
                    && newTourist.Id != existingTourist.Id
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