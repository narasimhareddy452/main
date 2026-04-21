trigger ContactDeleteassocitedAccount on Contact (before delete) {
    for(Contact con:trigger.old){
        if(con.AccountId!=null){
          con.addError('requested contact has an Account');  
        }        
    }
}