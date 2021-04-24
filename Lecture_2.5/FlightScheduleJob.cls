global class FlightScheduleJob implements Schedulable {

    public static String CRON_EXP = '0 00 00 * * ?';
 
    global static String scheduleMe() {
        FlightScheduleJob SC = new FlightScheduleJob(); 
        return System.schedule('My batch Job', CRON_EXP, SC);
    }

    global void execute(SchedulableContext sc) {

        FlightCleanerBatch b1 = new FlightCleanerBatch();
        ID batchprocessid = Database.executeBatch(b1,50);           
    }
}