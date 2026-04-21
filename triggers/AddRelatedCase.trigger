trigger AddRelatedCase on Account (before delete) {
    for(Account a : [SELECT Id from Account 
       WHERE Id IN( SELECT AccountId from Case) AND
                     Id IN :Trigger.old]){
         Trigger.oldMap.get(a.Id).addError('Account cant be deleted there are cases available');
       }

}