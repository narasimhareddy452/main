trigger TestAccountcannotDelete on Account (before delete) {
    // Shallow copy map
    Map<Id, Account> oldCopy = Trigger.oldMap.clone();
    // Keep only accounts that have at least one contact
    oldCopy.keySet().retainAll(
        new Map<Id, AggregateResult>(
            [SELECT AccountId Id 
             FROM Contact 
             WHERE AccountId = :Trigger.old 
             GROUP BY AccountId]).keySet());
    // Show error
    for(Account record: oldCopy.values()) {
        record.addError('You cannot delete an account with contacts.');
    }
}