trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        list<Task>tasks=new list<Task>();
        for(OpportunityChangeEvent event : trigger.new ){
         EventBus.ChangeEventHeader header= event.ChangeEventHeader;
            if ((header.ChangeType=='UPDATE') && (event.IsWon==true)){
                Task tk = new Task();
                tk.Subject = 'Follow up on won opportunities: ' + String.join(header.RecordIds, ', ');
                tk.OwnerId = header.CommitUser;
                tasks.add(tk);
            }
        }
        if (tasks.size() > 0) {
                  insert tasks;
                  }
        }
}