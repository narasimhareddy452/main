trigger ContactTriggerHandler on Contact (before delete) {
    if(Trigger.isBefore && TRigger.isDelete){
        ContactTriggerhandler.onBeforeDelete(Trigger.Old);
    }
}