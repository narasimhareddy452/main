public class DataQualityMetrics {
    @AuraEnabled
    public Integer dataQualityScore { get; set; }
    @AuraEnabled
    public Integer inactiveOwnerCount { get; set; }
    @AuraEnabled
    public Integer missingValuesCount { get; set; }
    @AuraEnabled
    public Integer duplicateRecordCount { get; set; }

    public DataQualityMetrics(Integer score, Integer inactiveCount, Integer missingCount, Integer duplicateCount) {
        this.dataQualityScore = score;
        this.inactiveOwnerCount = inactiveCount;
        this.missingValuesCount = missingCount;
        this.duplicateRecordCount = duplicateCount;
    }
}