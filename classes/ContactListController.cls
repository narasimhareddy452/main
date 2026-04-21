public class ContactListController {
@AuraEnabled
    public static List<Contact> getContactList(){
         List<Contact> contactList=new List<Contact>([select Id,Name,Email,Phone from Contact where Email!=null]);
         return contactList;
    }
}