public class updateTotalConsforAcc {
  public static void updateOwnedAccountCount(Set<Id>userIds){
        List<User>userToupdate=new List<User>();
        Map<Id,Integer>accountcountmap=new Map<Id,Integer>();
        for(AggregateResult result:[Select OwnerId ownerid,Count(Id) accountcount from Account where OwnerId IN:userIds Group By OwnerId]){
             Id ownerid =(Id)result.get('ownerid');
             Integer accountcount=(Integer)result.get('accountcount');
            accountcountmap.put(ownerid,accountcount);
        }
        for(User u:[Select Id from User where Id in:userIds]){
            if(accountcountmap.containskey(u.Id)){
             u.NumberOfAccounts__c=accountcountmap.get(u.Id);
           }            
        }
        if(!userToupdate.isEmpty()){
            update userToupdate;
        }
    }
}