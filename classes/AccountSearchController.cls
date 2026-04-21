public with sharing class AccountSearchController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String searchKey) {
        String key = '%' + searchKey + '%';
        return [SELECT Id, FirstName, LastName, Email, Phone, Account.Name FROM Contact WHERE Name LIKE :key];
    }
    @AuraEnabled(cacheable=true)
    public static List<Schema.Account> getAccounts(String accountName) {
        if (String.isBlank(accountName)) {
            return new List<Schema.Account>();
        }
        String key = '%' + accountName.trim() + '%';
        try {
            return [
                SELECT Id, Name, Phone, Industry, Type, Website
                FROM Account
                WHERE Name LIKE :key
                ORDER BY Name
                LIMIT 10
            ];
        } catch (Exception e) {
            throw new AuraHandledException('Account search failed: ' + e.getMessage());
        }
    }
    }