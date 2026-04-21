public with sharing class OpportunityDataQualityController {

    public class OpportunityWrapper {
        @AuraEnabled public Integer count;
        @AuraEnabled public List<Opportunity> records;

        public OpportunityWrapper(List<Opportunity> records) {
            this.records = records;
            this.count = records.size();
        }
    }

    @AuraEnabled(cacheable=true)
    public static OpportunityWrapper getInactiveOwners() {
        List<Opportunity> records = [SELECT Id, Name, OwnerId FROM Opportunity WHERE Owner.IsActive = FALSE];
        return new OpportunityWrapper(records);
    }

    @AuraEnabled(cacheable=true)
    public static OpportunityWrapper getInactivePicklistValues() {
        List<Opportunity> records = [SELECT Id, Name, StageName FROM Opportunity WHERE StageName IN ('Processing', 'Closed Loss')];
        return new OpportunityWrapper(records);
    }

    @AuraEnabled
    public static OpportunityWrapper getDuplicateRecords() {
        Map<String, Integer> nameCount = new Map<String, Integer>();
        List<Opportunity> allOpps = [SELECT Id, Name FROM Opportunity];
        List<Opportunity> duplicates = new List<Opportunity>();

        for (Opportunity opp : allOpps) {
            Integer count = nameCount.containsKey(opp.Name) ? nameCount.get(opp.Name) : 0;
            nameCount.put(opp.Name, count + 1);
        }

        for (Opportunity opp : allOpps) {
            if (nameCount.get(opp.Name) > 1) {
                duplicates.add(opp);
            }
        }

        return new OpportunityWrapper(duplicates);
    }

    @AuraEnabled
    public static OpportunityWrapper getMissingMandatoryFields() {
        List<Opportunity> records = [SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE StageName = NULL OR CloseDate = NULL];
        return new OpportunityWrapper(records);
    }
}