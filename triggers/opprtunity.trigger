trigger opprtunity on Opportunity (before insert,before update) {
    for (Opportunity opp : Trigger.new) {
        if (opp.StageName == 'Closed-Won' && opp.Amount == null) {
            opp.addError('Amount must be specified for Closed-Won opportunities.');
        }
    }
}