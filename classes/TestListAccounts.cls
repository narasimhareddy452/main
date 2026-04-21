public class TestListAccounts {
    public static void AccountsList(){
        List<string> acc=new List<string>{'Test1','Test2','Test3'};
            system.debug(acc);
            acc.add('Test4');
            acc.add('Test5');
            acc.add('Test3');
        system.debug(acc);
    }
}