public with sharing class SpoonacularIntegrationDAO {

    private static final SpoonacularIntegrationDAO instance = new SpoonacularIntegrationDAO();
    
    public static SpoonacularIntegrationDAO getInstance(){
        return instance;
    }
    public SpoonacularCallout__mdt getByLabel(String label) {
        List<SpoonacularCallout__mdt> lst = getBySetLabel(new Set<String>{ label });
        return lst.isEmpty() ? null : lst[0];
    }

public List<SpoonacularCallout__mdt> getBySetLabel(Set<String> setLabels) {
    return [
        SELECT  
            Label,
            Endpoint__c,
            Method__c,
            Token__c,
            ApiKey__c
        FROM
            SpoonacularCallout__mdt	
        WHERE
            Label IN :setLabels
    ];
    }
}