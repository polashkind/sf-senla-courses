public class SpacePointManager {

  public static List<Space_Point__c> getSpacePoint(){
    List<Space_Point__c> getLongLat = [
        SELECT longitude__c,
            latitude__c
        FROM Space_Point__c
    ];

    return getLongLat;
  }

}