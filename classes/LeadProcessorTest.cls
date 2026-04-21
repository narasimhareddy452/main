@isTest
Public class LeadProcessorTest{
    @isTest
    private static void testbatchclass(){
        //load test data
        List<Lead> leads=new List<Lead>();
        for(integer i=0;i<200;i++){
            leads.add(new Lead(LastName='Narasimha',Company='Salesforce'));
        }
        Insert leads;
        //perform test data
      System.Test.startTest();
    LeadProcessor lp=new LeadProcessor();
        Id batchId=Database.executeBatch(lp,200);
        System.Test.stopTest();
        //check Result    
       List<Lead> updatedLeads = [Select Id From Lead WHERE LeadSource = 'Dreamforce'];
        system.assertEquals(200, updatedLeads.size(), 'Error: Atleast One record is not updated correctly');    
        }

  }