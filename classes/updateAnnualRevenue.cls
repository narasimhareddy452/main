public class updateAnnualRevenue {
    public static void updateAR(){
        List<Contact>cons=[Select Id,LastName,Title from Contact LIMIT 5];
        for(Contact con:cons){
           con.Title='MFO';
            system.debug('Craeted'+con.Id);
        }
        update cons;
    }
}