public class OpportunityTriggerhandler {
    public static void onBeforeDelete(List<Opportunity> deletedOpportunities){
        Set<Id> oppId=new Set<Id>();
        //collect the accounts of the contacts being deleted
        for(Opportunity opp:deletedOpportunities){
            oppId.add(opp.AccountId);
        }
        //query no of Opportunities for each account
        Map<Id,Integer> AccountOppCount=new Map<Id,Integer>();
        for(Aggregateresult result:[Select AccountId,Count(Id) cnt from Opportunity where AccountId IN :oppId Group By AccountId]){
            AccountOppCount.put((Id)result.get('AccountId'),(Integer)result.get('cnt'));  
        }
        //check if the Opportunity is being deletd is the last contact of associated account
        for(Opportunity opp:deletedOpportunities){
            Integer opportunityCount=AccountOppCount.get(opp.AccountId);
            if(opportunityCount!=null && opportunityCount==1){
                opp.addError('Cannot delete the last opportunity associated with the account.');
                
            }
        }
    }
}