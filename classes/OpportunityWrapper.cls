public with sharing class OpportunityWrapper {    
    @AuraEnabled public Integer count;
    @AuraEnabled public List<Opportunity> records;

    public OpportunityWrapper(List<Opportunity> records) {
        this.records = records;
        this.count = records.size();
    }

}