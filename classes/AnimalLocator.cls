public class AnimalLocator{
  public static String getAnimalNameById(integer id){
    String url='https://th-apex-http-callout.herokuapp.com/animals/'+id;
    HttpRequest req=new HttpRequest();
    req.setEndpoint(url);
    req.setMethod('GET');
    Http http=new Http();
    HttpResponse res=http.send(req);
    if(res.getstatuscode()==200){
     Map<String,Object>results=(Map<String,Object>)JSON.deserializeUntyped(res.getbody());
     return (String)results.get('name');
     }else{
       throw new CalloutException('Error calling REST endpoint:::'+res.getStatusCode()+'-'+res.getBody());
     }
    
  }

}