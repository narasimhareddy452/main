trigger condel on Contact (before delete) {
    for(Contact con:[Select AccountId from Contact where AccountId in:Trigger.oldMap.keyset()]){
       Trigger.oldMap.get(con.AccountId).addError('Contact cant delete which is have account already');
    }
}