public class WeatherForecastUpdater {
    public static void updateForecasts() {
        List<Space_Point__c> spacePoints = SpacePointManager.getSpacePoint();
        
        for (Space_Point__c spacePoint : spacePoints) {
            Map<Date, Decimal> result = WeatherForecastService.getForecasts(spacePoint.Latitude__c, spacePoint.Longitude__c);
            
            system.debug(result);
        }
    }
}