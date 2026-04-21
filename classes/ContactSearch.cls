public class ContactSearch {
    public static list<Contact> searchForContacts(String lName,String mpostalcode){
      
        list<Contact> cons=[Select Id,firstName,lastName from Contact 
                            where lastname=:lName AND MailingPostalCode=:mpostalcode ];
        return cons;
    }
}