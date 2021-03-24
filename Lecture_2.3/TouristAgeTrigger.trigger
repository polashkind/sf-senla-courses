trigger TouristAgeTrigger on Flight__c (before insert) {
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            TouristAgeTriggerHandler.onBeforeInsert(Trigger.New);
        }
    }
}