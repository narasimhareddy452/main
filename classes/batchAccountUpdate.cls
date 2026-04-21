// Batch Job for Processing the Records

  global class batchAccountUpdate implements Database.Batchable<sObject> {

// Start Method

    global Database.QueryLocator start(Database.BatchableContext BC) {

        String query = 'SELECT Id,Name FROM Account';

        return Database.getQueryLocator(query);

    }

   // Execute method

    global void execute(Database.BatchableContext BC, List<Account> scope) {

         for(Account a : scope)

         {a.Name = a.Name + 'Updated';            

         }

         update scope;

    }   

    // Finish Method

    global void finish(Database.BatchableContext BC) {

    }

}