@isTest
public class TestOpportunityChangeTrigger {
    @isTest
    public static void testCreateAndUpdateOpportunity() {
        // Enable Change Data Capture
       // Test.enableChangeDataCapture();        
        // Step 1: Create and insert an Opportunity
        Opportunity op1 = new Opportunity();
        op1.Name = 'Sell 100 Widgets';
        op1.StageName = 'Prospecting';
        op1.CloseDate = Date.today().addMonths(3);
        insert op1;        
        // Deliver initial change event (insert)
       // Test.getEventBus().deliver();        
        // Step 2: Update the Opportunity to 'Closed Won'
        Opportunity[] oppRecords=[SELECT Id, StageName FROM Opportunity];
        Opportunity opp = oppRecords[0];
        opp.StageName = 'Closed Won';
        update opp;        
        // Deliver update change event
        //Test.getEventBus().deliver();        
        // Step 3: Query Task records and verify
        Task[] taskList = [SELECT Id, Subject FROM Task];
        System.assertEquals(1, taskList.size(), 'The change event trigger did not create the expected task.');
        
        // Validate the Task Subject
       // System.assert(taskList[0].Subject.contains('Follow up on won opportunities'), 
         //   'The task subject does not contain the expected text.');
    }
}