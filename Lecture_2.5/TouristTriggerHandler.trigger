trigger TouristTriggerHandler on Tourist__c (after insert, after update) {

    if (TouristTriggerHandler.isFirstTime) {
        TouristTriggerHandler.isFirstTime = false;
   
        switch on Trigger.operationType {
            when AFTER_INSERT {
                TouristTriggerHandler.markDuplicates(Trigger.New);
            }
            
            when AFTER_UPDATE {
                TouristTriggerHandler.flightStatusDeclined(Trigger.New);
            }
        }
    }
}