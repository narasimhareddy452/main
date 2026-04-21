public class MyController1 {
private final Account account;

    public MyController1() {
        account = [SELECT Id, Name, Site FROM Account 
                   WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }

    public void getAccount(string name) {
       system.debug('name');
    }

    public PageReference save() {
        update account;
        return null;
    }
}