public with sharing class CaseWebServiceConnect {
    public static String getCaseFromSalesforceOrgB() {
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        String salesforceURL = Url.getOrgDomainUrl().toExternalForm();
        String salesforceSessionId = System.UserInfo.getSessionId().substring(15);

        request.setEndpoint( salesforceURL + '/services/apexrest/Cases');

        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer ' + salesforceSessionId);

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