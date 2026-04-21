({
	doInit : function(component, event, helper) {
	/* Step1 */
        var action=component.get('c.getContactList');
        /* Optional */
        action.setParams({
            
        });
        /* Step 4*/
            action.setCallback(this, function(response){
                               var responseValue=response.getReturnValue();
                console.log('responseValue',responseValue);
                component.set('v.contactList',responseValue);
             },'SUCCESS');
        /* Step3 */
    $A.enqueueAction(action,false);
       	}	
	})