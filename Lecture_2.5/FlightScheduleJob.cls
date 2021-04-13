global class FlightScheduleJob implements Schedulable {
  // здесь мы задаем временную точку (ниже будет подробнее про это)
    public static String CRON_EXP = '0 0 0 * * ?';
 
    global void execute(SchedulableContext ctx) {
        // получаем cron trigger
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :ctx.getTriggerId()];
        // можно выполнять так же необходимы проверки
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);

    FlightCleanerBatch();
 } 
 
// метод, в котором вызываем Batch
  public void FlightCleanerBatch() {
        ChangeDiscoutsStatus deletedFlightBatch = new FlightScheduleJob();
        Database.executeBatch(deletedFlightBatch, 100);
  } 
}