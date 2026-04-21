@RestResource(urlMapping='/showAccounts/*')
global class checkAccount
{
 @HttpGet
 global static Account doGet(){
 RestRequest req=Restcontext.request;
 RestResponse res=Restcontext.response;
 string accountId=req.requestURI.substring(req.requestURI.lastindexof('/')+1);
 system.debug('Account Id:'+accountId);
 Account result=[Select Id, Name, Phone, website from Account where Id=:accountId];
 return result;
 }
 @HttpPost
 global static string doPost(string Name, string Phone, string AccountNumber)
 {
  Account acc= new Account();
  acc.Name=Name;
  acc.Phone=Phone;
  acc.AccountNumber =AccountNumber;
  insert acc;
  return acc.id; 
 }
  @HttpDelete
 global static void doDelete()
  {
  RestRequest req=Restcontext.request;
  RestResponse res=Restcontext.response;
  string accNumber=req.requestURI.substring(req.requestURI.lastindexof('/')+1);
  Account result=[Select Id, Name, Phone, website from Account where AccountNumber=:accNumber];
  Delete result;
  }   
 }
 /* global static LIST<Account> getAccount()
 {
  LIST<Account> lst;
  try  
  {
   lst=[select Name, Phone from Account];
   return lst;
  }
  catch(Exception ex)
  {
   system.debug('error'+ex.getMessage());
  }
  return lst;
 }
} 
*/