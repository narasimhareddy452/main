trigger UpdateAccountLastmodifiedBy on Opportunity (after update) {
  Set<Id> accountIds=new Set<Id>();
    
    for(Opportunity opp:Trigger.new){
        if(Trigger.isUpdate && opp.AccountId!=null){
            accountIds.add(opp.AccountId);
        }  
    }
    //List<Account> accountsToUpdate=[SELECT Id FROM Account WHERE Id IN :accountIds];
    
    //for(Account acc:accountsToUpdate){
        //acc.LastModifiedById=UserInfo.getUserId();
    //}
    //update accountsToUpdate;
}