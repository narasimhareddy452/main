trigger AddRelatedRecord on Account (after insert, after update) {
List<Opportunity> oppList=new List<Opportunity>();
    //get the related opps  for this trigger
    Map<Id,Account> acctswithopps=new Map<Id,Account>(
        [Select Id,(Select Id from Opportunities) from Account where Id IN:Trigger.New]);
    
    for (Account a :Trigger.New){
                system.debug('acctswithopps.get(a.Id).Opportunities.size()=' +acctswithopps.get(a.Id).Opportunities.size());
             if(acctswithopps.get(a.Id).Opportunities.size()==0){
              oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=a.Id));
                }
        if (oppList.size() > 0) {
        insert oppList;
        }
    }
}