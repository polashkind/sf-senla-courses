trigger TouristTrigger on Tourist__c (before insert, after update) {

    if (TouristServiceHandler.isFirstTime) {
        TouristServiceHandler.isFirstTime = false;
   
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                TouristServiceHandler.markDuplicates(Trigger.New);
            }
            
            when AFTER_UPDATE {
                TouristServiceHandler.flightStatusDeclined(Trigger.New);
            }
        }
    }
}