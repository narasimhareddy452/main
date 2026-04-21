public class AccountUtility {
     public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT Name,AnnualRevenue FROM Account];
        for (Account act : accountsList){
            string acctRev = act.Name+':' +act.AnnualRevenue;
            system.debug(acctRev);
        }
    }

}