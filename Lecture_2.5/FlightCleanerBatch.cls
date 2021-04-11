public class FlightCleanerBatch implements Database.Batchable<sObject>, Database.Stateful {

    private static String query = 'SELECT Id, Tourist__r.Name, ' +
                                'Tourist__r.Id ' +
                                'FROM Flight__c  ' +
                                'WHERE Tourist_Status__c = \'Declined\' AND createdDate > LAST_N_DAYS:30';
    
    
    public Integer recordsProcessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }

    public  void execute(Database.BatchableContext bc,List<sObject> scope){
        Database.DeleteResult[] drList = Database.delete(scope, false);
        for(Database.DeleteResult dr : drList) {
            if (dr.isSuccess()) {
                // Operation was successful, so get the ID of the record that was processed
                System.debug('Successfully deleted account with ID: ' + dr.getId());
            } else {
                // Operation failed, so get all errors                
                for(Database.Error err : dr.getErrors()) {
                    System.debug('The following error has occurred.');                    
                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                    System.debug('Account fields that affected this error: ' + err.getFields());
                }
            }
        }

        recordsProcessed = recordsProcessed + 1;
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