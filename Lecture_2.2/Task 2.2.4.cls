public class TouristService {
    public static void markDuplicates(List<Tourist__c> newTourists) {
        for (Integer i = 0; i < newTourists.size() - 1; i++) {
            Tourist__c tourist = newTourists.get(i);
            
            for (Integer j = i + 1; j < newTourists.size(); j++) {
                Tourist__c touristToCompare = newTourists.get(j);
                
                if (
                    tourist.Tourist_Last_Name__c == touristToCompare.Tourist_Last_Name__c 
                    && tourist.Email__c == touristToCompare.Email__c
                ) {
                    tourist.IsDuplicate__c = true;
                    touristToCompare.IsDuplicate__c = true;
                    
                    update tourist;
                    update touristToCompare;
                }
            }
        }
    }      
}