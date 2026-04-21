public class myController {
private final Account account;
    public MyController(){
        account=[select Id, Name,Site from Account where Id=:ApexPages.currentPage().getParameters().get('Id')];
    }
    public Account getAccount(){
        return account;
    }
    public PageReference save(){
        update account;
        return null;
    }
}