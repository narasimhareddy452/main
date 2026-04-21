public class updateFunctionalArea implements Database.Batchable<SObject>{
      public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, FunctionalArea__c FROM Position__c');
    }

    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        list<Position__c>positiontoUpdate=(list<Position__c>)scope;
        for(Position__c po : positiontoUpdate) {
            if(Position__c.FunctionalArea__c==Null){
                 po.FunctionalArea__c = 'Others';
              }
            else{}
        }
        update positiontoUpdate;
    }

    public void finish(Database.BatchableContext bc) {
        // Optional post-processing logic
    }
}