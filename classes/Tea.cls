public class Tea {
    public static void orderTea(){
        Map<string,string>teaTypes=new Map<string,string>();
        teaTypes.put('Black', 'Earthy');
        teaTypes.put('White', 'Sweet');
        teaTypes.put('Herbal', 'Sweet');
        system.debug(teaTypes);
        string flavourProfile=teaTypes.get('Black');
        system.debug('The flavourProfile of Black is:::'+flavourProfile);
        //return flavourProfile;
    }
}