trigger TouristTrigger on Tourist__c (before insert) {
    // Set to store email ids
    Set <String> emailSet = new Set<String>(); 
    // Set to store last name
    Set <String> lastNameSet = new Set<String>(); 
    // Iterate through each Contact and add their email and last name to their respective Sets
    for (Tourist__c trs:trigger.new) {
        emailSet.add(trs.Email__c);
        lastNameSet.add(trs.Tourist_Last_Name__c);
    }
    // New list to store the found email or last name
    List <Tourist__c> touristList = new List<Tourist__c>();
    // Populating the list using SOQL
    touristList = [SELECT Email__c,Tourist_Last_Name__c FROM Tourist__c WHERE Email__c IN :emailSet AND Tourist_Last_Name__c IN :lastNameSet];
    // Iterating through each Tourist record to see if the same email or last name was found
    for (Tourist__c trs:trigger.new) {
        if (touristList.size() > 0) {
            trs.IsDuplicate__c = true;
        }
    }
}