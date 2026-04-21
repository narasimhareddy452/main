trigger preventdeletionoflastcon on Contact (before delete) {
    Map<Id,List<Contact>>accountconMap=new Map<Id,List<Contact>>();
    List<Contact>tempconList=new List<Contact>();
    Set<Id>accId=new Set<Id>();        //create empty list to store Ids
    for(Contact con:trigger.old){    
      accId.add(con.accountId);  
    }
    for(Contact con:[select AccountId from Contact where AccountId in:accId]){
        if(accountconMap.keyset().contains(con.AccountId)){
         tempconList= accountconMap.get(con.AccountId);  
        } else{
            tempconList=new List<Contact>();
        }
        tempconlist.add(con);
        accountconMap.put(con.Accountid,tempconList);
    }
    for(Contact con:trigger.old){
        if(accountconMap.get(con.AccountId).size()==1){
            con.addError('last contact cant be delete');
        }
    }
}