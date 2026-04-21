trigger GenderTrigger on Candidate__c (before insert,before update) {
    for(Candidate__c can:trigger.new){
        if(can.Gender__c=='Male'){
            can.Name__c='Mr.'+can.Name__c;
        }
        if(can.Gender__c=='Female'){
            can.Name__c='Miss.'+can.Name__c;
        }
        if(can.Gender__c=='Others'){
            can.Name__c=can.Name__c;
        }
    }
}