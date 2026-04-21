public with sharing class SearchAccounts {
    @AuraEnabled(cacheable=true)
    public static List<Product2> retriveProducts(String strProdName){
        try {
            strProdName = '%' + strProdName + '%';
            List<Product2> lstProd = [SELECT  Id, Name, ProductCode FROM Product2 WHERE Name LIKE :strProdName WITH SECURITY_ENFORCED];
            return lstProd; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
     }
}