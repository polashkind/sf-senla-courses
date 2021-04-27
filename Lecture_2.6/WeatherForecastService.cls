public with sharing class WeatherForecastService {
    public static Map<Date, Decimal> getForecasts(Decimal latitude, Decimal longitude) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String apiKey = Constants.API_KEY;
        String url = 'https://api.weatherbit.io/v2.0/forecast/daily?key='+apiKey+'&lat='+latitude+'&lon='+longitude+'&days=10';

        request.setEndpoint(url);
        request.setMethod('GET');

        HttpResponse response = http.send(request);
        
        Map<Date, Decimal> result = new Map<Date, Decimal>();
        
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> data = (List<Object>) results.get('data');
            
            for (Integer i = 0; i < data.size(); i++) {
                Map<String, Object> dataItem = (Map<String, Object>)data[i];
                
                Date currentDate = Date.valueOf(String.valueOf(dataItem.get('datetime')));
                Decimal temp = Decimal.valueOf(String.valueOf(dataItem.get('temp')));
 
            	result.put(currentDate, temp);  
            }
        }

        return result;
    }
}