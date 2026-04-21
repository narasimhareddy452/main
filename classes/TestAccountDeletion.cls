@isTest
public class TestAccountDeletion {
    @isTest static void TestDeleteAccountwithopps(){
        //create Account with opp
        Account acc=new Account(Name='Test Account');
        insert acc;
        Opportunity opp=new Opportunity(Name=acc.Name +'Opportunity',
                                        StageName='Prospecting',
                                        CloseDate=System.today().addMonths(1),
                                        AccountId=acc.Id);
        insert opp;
        //perform Tests
        Test.startTest();
        Database.DeleteResult result =Database.delete(acc, false);
        Test.stopTest();
        //Verify
        system.assert(!result.isSuccess());
        system.assert(result.getErrors().size()>0);
        system.assertEquals('cannot delete account related opps', result.getErrors()[0].getMessage());
    }

}