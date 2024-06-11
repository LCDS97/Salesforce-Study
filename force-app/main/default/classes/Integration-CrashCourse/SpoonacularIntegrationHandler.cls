public with sharing class SpoonacularIntegrationHandler {
    public static void getRecipeInformation() {
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        SpoonacularCallout__mdt config = SpoonacularIntegrationDAO.getInstance().getByLabel('Random Recipes');
        String apiURL = config.Endpoint__c;
        String calloutMethod = config.Method__c;
        String apiKey = '?apiKey=' + config.ApiKey__c;
        apiURL = apiURL + apiKey;
        System.debug('apiKey: ' + apiKey);


        request.setMethod(calloutMethod);
        request.setEndpoint(apiURL);
        request.setHeader('Content-Type', 'application/json');
        // request.setHeader('Authorization', apiKey);

        HttpResponse response = http.send(request);
        System.debug('request: ' + request);
        System.debug('response: ' + response);
        System.debug('response code ' + response.getStatusCode());

        if(response.getStatusCode() == 200){
            System.debug('response ' + response.getBody());
        }
        else {
            System.debug('Error: ' + response.getBody());
        }
    }
}