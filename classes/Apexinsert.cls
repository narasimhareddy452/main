public class Apexinsert {
    public void insertMyAccount(){
      Account acc =new Account();
      acc.name='PNCR Solutions';
      acc.industry='HealthInsurance';
      acc.rating='Hot';
      acc.phone='8800234766';
      Insert acc;
      system.debug('Account Id:' +acc.id);  
     }
    public void insertMyContact(){
      Contact con=new contact();
	  con.lastname='Kaur';
      con.firstname='Rajan';
      con.phone='7802227788';
      con.email='rajaa543@gmail.com';
      //con.birthdate=date.parse(str)'31-08-90';
      con.birthdate=date.newinstance(1990,02,31);
      con.accountId='0012w00000zhHN7AAM';
      insert con;
      system.debug('contact Id :' +con.id);
    }
    public void insertMyOpportunity(){
    Opportunity opp=new Opportunity();
    opp.name='Salesforce New Opp';
    opp.stagename='Closed Loss';
    opp.closedate=Date.newInstance(2000, 03, 30);
    opp.accountId='0012w00000zhHN7AAM';
    insert opp;
    system.debug('Opportunity Id :'+opp.id);  
     }
 }