public with sharing class SpoonacularIntegrationHandler {
    public static String getRandomRecipe() {
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

        HttpResponse response = http.send(request);
        System.debug('response code ' + response.getStatusCode());

        if(response.getStatusCode() == 200){
            System.debug('response ' + response.getBody());
            return response.getBody();
        }
        else {
            System.debug('Error: ' + response.getBody());
            return response.getBody();
        }
    }

    public static String getRecipeInformationById(String recipeId) {
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        SpoonacularCallout__mdt config = SpoonacularIntegrationDAO.getInstance().getByLabel('Recipe By Information');
        String apiURL = config.Endpoint__c.replace('{id}', recipeId);
        System.debug('apiURL after: ' + apiURL);
        String calloutMethod = config.Method__c;
        String apiKey = '?apiKey=' + config.ApiKey__c;
        apiURL = apiURL + apiKey;
        System.debug('apiKey: ' + apiKey);


        request.setMethod(calloutMethod);
        request.setEndpoint(apiURL);
        request.setHeader('Content-Type', 'application/json');

        HttpResponse response = http.send(request);
        System.debug('response code ' + response.getStatusCode());

        if(response.getStatusCode() == 200){
            System.debug('response ' + response.getBody());
            return response.getBody();
        }
        else {
            System.debug('Error: ' + response.getBody());
            return response.getBody();
        }
    }

    public static String getRecipeByIngredients(String ingredients) {
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        SpoonacularCallout__mdt config = SpoonacularIntegrationDAO.getInstance().getByLabel('Recipe By Ingredients');
        String apiURL = config.Endpoint__c + '?ingredients=' + ingredients;
        System.debug('apiURL after: ' + apiURL);
        String calloutMethod = config.Method__c;
        String apiKey = '&apiKey=' + config.ApiKey__c;
        apiURL = apiURL + apiKey;
        System.debug('apiKey: ' + apiKey);


        request.setMethod(calloutMethod);
        request.setEndpoint(apiURL);
        request.setHeader('Content-Type', 'application/json');

        HttpResponse response = http.send(request);
        System.debug('response code ' + response.getStatusCode());

        if(response.getStatusCode() == 200){
            System.debug('response ' + response.getBody());
            return response.getBody();
        }
        else {
            System.debug('Error: ' + response.getBody());
            return response.getBody();
        }
    }
}