trigger TouristTrigger on Tourist__c (before insert, after update) {

    if (TouristService.isFirstTime) {
        TouristService.isFirstTime = false;
   
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                TouristService.markDuplicates(Trigger.New);
            }
            
            when AFTER_UPDATE {
                TouristService.flightStatusDeclined(Trigger.New);
            }
        }
    }
}