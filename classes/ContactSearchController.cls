public with sharing class ContactSearchController {
    @AuraEnabled //(cacheable=true)
    public static List<Contact> getContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [SELECT Id, FirstName, LastName, Email, Phone, Account.Name FROM Contact WHERE Name LIKE :key LIMIT 10];
}
}