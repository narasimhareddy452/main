global class LeadProcessorSchedulable implements schedulable {
    global void execute(schedulablecontext sc){
        LeadProcessor leadbatch=new LeadProcessor();
        database.executeBatch(leadbatch, 200);
    }

}