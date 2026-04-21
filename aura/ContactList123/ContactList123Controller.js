({
	doInit : function(component, event, helper) {
	var action=component.get('c.getContactList');
        action.setParams({
            
        });
            action.setCallback(this,function(response){
                               var responseValue=response.getReturnValue();
                console.log('responseValue',responseValue);
             },'Success');
    $A.enqueueAction(action,false);
        
	}
})