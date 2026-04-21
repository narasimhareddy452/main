public with sharing class DataQualityController {
    @AuraEnabled(cacheable=true)
    public static DataQualityMetrics getDataQualityMetrics() {
        try {
            Integer inactiveOwnerCount = getInactiveOwnerCount();
            Integer missingValuesCount = getMissingValuesCount();
            Integer duplicateRecordCount = getDuplicateRecordCount();

            Integer totalCount = 3; // Number of metrics
            Integer totalIssues = inactiveOwnerCount + missingValuesCount + duplicateRecordCount;
            Integer dataQualityScore = totalCount > 0 ? (totalIssues * 100) / (totalCount * 3) : 0;

            return new DataQualityMetrics(dataQualityScore, inactiveOwnerCount, missingValuesCount, duplicateRecordCount);
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching data quality metrics: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static DataQualityMetrics getObjectMetrics(String objectName) {
        try {
            Integer inactiveOwnerCount = getInactiveOwnerCountForObject(objectName);
            Integer missingValuesCount = getMissingValuesCountForObject(objectName);
            Integer duplicateRecordCount = getDuplicateRecordCountForObject(objectName);
            system.debug('inactiveOwnerCount '+inactiveOwnerCount+' missingValuesCount '+missingValuesCount+' duplicateRecordCount '+duplicateRecordCount);

            return new DataQualityMetrics(0, inactiveOwnerCount, missingValuesCount, duplicateRecordCount);
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching object metrics: ' + e.getMessage());
        }
    }   
    // Helper methods to calculate metrics
    private static Integer getInactiveOwnerCount() {
        // Logic to calculate inactive owner count for Account and Opportunity
        Integer accountCount = [SELECT COUNT() FROM Account WHERE Owner.IsActive = false];
        Integer contactCount =[SELECT COUNT() FROM Contact WHERE Owner.IsActive = false];
        Integer opportunityCount = [SELECT COUNT() FROM Opportunity WHERE Owner.IsActive = false];
        return accountCount + contactCount + opportunityCount;
    }

    private static Integer getMissingValuesCount() {
        // Logic to calculate missing values count for Account and Opportunity
        Integer accountCount = [SELECT COUNT() FROM Account WHERE Name = NULL];
        Integer contactCount =[SELECT COUNT() FROM Contact WHERE FirstName = NULL OR LastName = NULL OR Title = NULL OR Email = NULL OR Phone = NULL];
        Integer opportunityCount = [SELECT COUNT() FROM Opportunity WHERE Name = NULL];
        return accountCount + opportunityCount;
    }

    private static Integer getDuplicateRecordCount() {
        // Logic to calculate duplicate record count for Account and Opportunity
        Set<String> duplicateNames = new Set<String>();
        for (AggregateResult result : [SELECT Name, COUNT(Id) cnt FROM Account GROUP BY Name HAVING COUNT(Id) > 1]) {
            duplicateNames.add((String)result.get('Name'));
        }
         for (AggregateResult result : [SELECT Name, COUNT(Id) cnt FROM Contact GROUP BY Name HAVING COUNT(Id) > 1]) {
            duplicateNames.add((String)result.get('Name'));
        }
        for (AggregateResult result : [SELECT Name, COUNT(Id) cnt FROM Opportunity GROUP BY Name HAVING COUNT(Id) > 1]) {
            duplicateNames.add((String)result.get('Name'));
        }
        return duplicateNames.size();
    }

    private static Integer getInactiveOwnerCountForObject(String objectName) {
        // Logic to calculate inactive owner count for a specific object
        system.debug('The object we are querying is getinactive owner count '+objectName);
        String query = 'SELECT COUNT() FROM ' + objectName + ' WHERE Owner.IsActive = false';
        return Database.countQuery(query);
    }

    private static Integer getMissingValuesCountForObject(String objectName) {
        // Logic to calculate missing values count for a specific object
        String query = 'SELECT COUNT() FROM ' + objectName + ' WHERE Name = NULL';
        return Database.countQuery(query);
    }

    private static Integer getDuplicateRecordCountForObject(String objectName) {
        // Logic to calculate duplicate record count for a specific object
        String query = 'SELECT Name, COUNT(Id) cnt FROM ' + objectName + ' GROUP BY Name HAVING COUNT(Id) > 1 LIMIT 2000';
        List<AggregateResult> results = Database.query(query);
        return results.size();
    }

}