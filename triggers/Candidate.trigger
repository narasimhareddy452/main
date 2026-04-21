trigger Candidate on Candidate__c (before delete) {
delete [select Id from JobApplication__c where Candidate__c in:trigger.old];
}