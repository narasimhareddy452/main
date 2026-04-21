public with sharing class ContactController {
@AuraEnabled
    public static List<Contact> getContact() {
       List<Contact> contacts= [select Id, Name from Contact];
        return contacts;
    }
    public static List<Contact>getContacts(){
        List<Contact> cons=[Select Id,Name,Email,Phone from Contact Limit 20];
        return cons;
    }
}