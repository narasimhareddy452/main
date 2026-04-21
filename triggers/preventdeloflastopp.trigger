trigger preventdeloflastopp on Opportunity (before delete) {
    Map<Id,List<Opportunity>>accountoppMap=new Map<Id,List<Opportunity>>();
    list<Opportunity>tempoppList=new List<opportunity>();
    set<Id>accId=new set<Id>();
    for(Opportunity opp:trigger.old){
        accId.add(opp.AccountId);
    }
    for(Opportunity opp:[Select AccountId from Opportunity where AccountId in :accId]){
        if(accountoppMap.keyset().contains(opp.AccountId)){
          tempoppList= accountoppMap.get(opp.AccountId); 
        } 
        else{
          tempoppList=new List<opportunity>();  
        }
        tempoppList.add(Opp);
        accountoppMap.put(opp.AccountId,tempoppList);
    }
    for(Opportunity opp:trigger.old){
        if(accountoppMap.get(opp.AccountId).size()==1){
         opp.addError('Last opp of Account cant be delete');   
        }  
    }
}