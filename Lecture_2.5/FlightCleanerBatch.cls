public class FlightCleanerBatch implements Database.Batchable<sObject>, Database.Stateful {

    private static String query = 'SELECT Id, Tourist__r.Name, Tourist__r.Id FROM Flight__c  WHERE Tourist_Status__c = \'Declined\' OR createdDate > LAST_N_DAYS:30';
    public Integer recordsProcessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }

    public  void execute(Database.BatchableContext bc,List<sObject> scope){

        

        recordsProcessed = recordsProcessed + 1;

        delete scope;
    }

    public void finish (Database.BatchableContext bc) {
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
        EmailUtils.sendMessage(job, recordsProcessed);
    }
}