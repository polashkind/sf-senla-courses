trigger TouristTriggerHandler on Tourist__c (after insert, after update) {

    if (TouristTriggerHandler.isFirstTime) {
        TouristTriggerHandler.isFirstTime = false;
   
        switch on Trigger.operationType {
            when AFTER_INSERT {
                // Set<Id> touristIds = new Set<Id>();
                
                // for (Tourist__c tourist : Trigger.New) {
              	// 	touristIds.add(tourist.Id);
        		// }
                
                TouristTriggerHandler.markDuplicates(touristIds);
            }
            
            when AFTER_UPDATE {
                TouristTriggerHandler.flightStatusDeclined(Trigger.New);
            }
        }
    }
}