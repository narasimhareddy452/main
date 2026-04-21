public class EmailManager {
    public static void sendMail(String address,String subject,String body){
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        String[] toAddresses=new String[]{address};            
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        Messaging.SendEmailResult[] results=Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        inspectResults(results);
       }
    private static Boolean inspectResults(Messaging.SendEmailResult[] results){
      Boolean sendResult=true;
        for(Messaging.SendEmailResult res: results){
        if(res.isSuccess())
    {
        system.debug('Email sent Successfully');
    }
    else
    {
        sendResult=false;
        system.debug('following errors or occured:' +res.getErrors());
    }
}
return sendResult;    
  }
}