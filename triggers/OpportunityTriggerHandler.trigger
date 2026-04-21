trigger OpportunityTriggerHandler on Opportunity (before delete) {
    if(Trigger.isInsert && Trigger.isDelete){
        OpportunityTriggerhandler.onBeforeDelete(Trigger.Old);
    }
}