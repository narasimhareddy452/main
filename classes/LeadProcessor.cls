global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{
  // instance member to retain state across transactions
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID,LeadSource FROM Lead');
 }
    global void execute(Database.BatchableContext bc, List<lead> scope){
        // process each batch of records
        List<Lead> leads = new List<Lead>();
        for (lead l : scope) {            
                l.LeadSource = 'Dreamforce';
            leads.add(l);
                // increment the instance member counter
                recordsProcessed = recordsProcessed + 1;
        }
        update leads;
    } 
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed by Narasimha!');
        
    }    
}