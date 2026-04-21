public class Overloading {
    public void walk(){
        system.debug('No Argument method executed');
    }
    public void walk(integer speed){
        system.debug('Integer Argument method executed');
    }
    public void walk(string name){
        system.debug('string Argument method executed');
    }
    public void walk(integer speed ,string name){
        system.debug('string, integer Argument method executed');
    }
    public void show(){
        system.debug('Welcome to Salesforce');
    }

}