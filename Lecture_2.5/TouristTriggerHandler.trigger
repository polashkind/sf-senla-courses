trigger TouristTriggerHandler on Tourist__c (after insert, after update) {

    if (TouristServiceHandler.isFirstTime) {
        TouristServiceHandler.isFirstTime = false;
   
        switch on Trigger.operationType {
            when AFTER_INSERT {
                Set<Id> touristIds = new Set<Id>();
                
                for (Tourist__c tourist : Trigger.New) {
              		touristIds.add(tourist.Id);
        		}
                
                TouristServiceHandler.markDuplicates(touristIds);
            }
            
            when AFTER_UPDATE {
                TouristServiceHandler.flightStatusDeclined(Trigger.New);
            }
        }
    }
}