public class TouristManagerCustom {
  
  public static List<Tourist__c> getByEmailLastName(){
      List<Tourist__c> searchTouristByEmailLastName = [
          SELECT Tourist_Last_Name__c,
                 Email__c
            FROM Tourist__c
      ];
      return searchTouristByEmailLastName;
  }
}