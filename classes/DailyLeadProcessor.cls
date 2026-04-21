public without sharing class DailyLeadProcessor implements Schedulable {
   public void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT ID,LeadSource FROM Lead where leadsource=null Limit 200];
         for (lead l : leads) {            
                l.LeadSource = 'Dreamforce';
                leads.add(l);
        }
        update leads;
    } 
}