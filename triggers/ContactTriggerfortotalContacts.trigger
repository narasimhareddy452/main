trigger ContactTriggerfortotalContacts on Contact (after insert,after update,after delete) {
 
  Set<Id>AccIds=new Set<Id>();
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
             for(Contact con:Trigger.new){                 
                     AccIds.add(con.AccountId);                
                           }
        }
        if(Trigger.isDelete){
             for(Contact con:Trigger.old){                 
                    AccIds.add(con.AccountId);                            
             }         
        }
        if(!AccIds.isEmpty()){
            updateTotalConsforAcc.updateOwnedAccountCount(AccIds);
        }
}
}