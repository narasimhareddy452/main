@RestResource(urlmapping='/accountCustomRest/v1.0')
global with sharing class AccountRestService {
    
    @HttpGet
    global static String getAccounts(){
      	 RestRequest req = RestContext.request;
         RestResponse res = RestContext.response;
        return JSON.serialize([SELECT Id,Name from Account LIMIT 10]);
        //
    }

}