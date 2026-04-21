public class ContactTriggerhandler {
    public static void onBeforeDelete(List<Contact>deletedcontacts){
        Set<Id>accId=new Set<Id>();
        //collect the accounts of the contacts being deleted
        for(Contact con:deletedcontacts){
            accId.add(con.AccountId);
        }
        //query no of contacts for each account
        Map<Id,Integer>AccountConCount=new Map<Id,Integer>();
        for(Aggregateresult result:[Select AccountId,Count(Id) cnt from Contact where AccountId IN :accId Group By AccountId]){
          AccountConCount.put((Id)result.get('AccountId'),(Integer)result.get('cnt'));  
        }
        //check if the contact is being deletd is the last contact of associated account
        for(Contact con:deletedcontacts){
            Integer contactCount=AccountConCount.get(con.AccountId);
            if(contactCount!=null && contactCount==1){
                con.addError('Cannot delete the last contact associated with the account.');
                
            }
        }
    }
}