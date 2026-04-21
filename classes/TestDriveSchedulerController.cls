public with sharing class TestDriveSchedulerController {
    @AuraEnabled(cacheable=true)
    public static List<FVehicles__c>getVehicles(){
        try {
            return [SELECT Id, Name FROM FVehicles__c WHERE Status__c='Available'];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact>getContacts(){
        try {
            return[SELECT Id,Name FROM Contact];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static List<User>getSalesReps(){
        try {
           return[SELECT Id,Name FROM User WHERE Profile.Name='Sales Rep']; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static void createTestDrive(TestDrive__c testDrive){
        try {
            insert testDrive;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}