trigger noofcons on Contact (after insert,after update, after delete,after undelete) {
   ContactTriggerHandlernoofCons.handleTrigger();
}