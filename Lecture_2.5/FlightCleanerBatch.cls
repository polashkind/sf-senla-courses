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
                recordsProcessed = recordsProcessed + 1;
            } 
        }
    }

    public void finish (Database.BatchableContext bc) {
        AsyncApexJob job = [
            SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()
            ];

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {job.CreatedBy.Email};
        mail.setToAddresses(toAddresses);
        mail.setReplyTo(Constants.SEND_FINAL_EMAIL);
        mail.setSubject('Match Merge Batch ' + job.Status);
        mail.setPlainTextBody('The batch Apex job processed ' + job.TotalJobItems +
        ' batches with '+ job.NumberOfErrors + ' failures. ' + recordsProcessed);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
}