public class TripInfoController {
    public Trip__c trip {get; set;}
    public boolean editSection {get;set;}
    
    public TripInfoController(ApexPages.StandardController stdController) {}
    
    public PageReference EditTheSection() {
        editSection = true;
        return null;
    }
}