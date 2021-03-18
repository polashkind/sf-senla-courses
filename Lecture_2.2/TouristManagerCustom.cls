public class TouristManagerCustom {
  
  public static List<Tourist__c> getByEmailLastName(){
      List<Tourist__c> searchTouristByEmailLastName = [
          SELECT Tourist_Last_Name__c,
                 Email__c
            FROM Tourist__c
      ];
      return searchTouristByEmailLastName;
  }

  public static List<Tourist__c> getByStatus(){
    List<Flight__c> searchStatusForFlight = [
          SELECT Tourist_Status__c,
                  Trip__r.Start_Date__c,
                  Tourist__r.Is_Active__c
          FROM Flight__c
          WHERE Tourist__c =: newTourist.Id
      ];
      return searchStatusForFlight;
  }
}