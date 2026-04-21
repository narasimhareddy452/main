trigger AddRelatedRecords on Account (before delete) {
    for(Account a: [SELECT Id from Account
                    WHERE Id IN (SELECT AccountId FROM Contact) AND 
                    Id IN :Trigger.old]){
        Trigger.oldMap.get(a.Id).addError('Accounts cant be deleted there are related contacts available.');
    }
}