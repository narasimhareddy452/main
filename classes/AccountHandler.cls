public class AccountHandler {
    public static void insertAccount(Integer value){        
        List<Account> addAccounts = new List<Account>();
        Integer counter = 0;
        while(counter<=value){
            Account a = new Account();
            a.Name = 'Acme Inc'+counter;
            a.AccountNumber = 'A000'+counter;
            addAccounts.add(a);
            counter++;
         }
        insert addAccounts;        
    }
}