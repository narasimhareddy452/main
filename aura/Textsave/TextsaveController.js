({
	doclick : function(component, event, helper) {
    alert(component.isValid());	
	alert(component.getName());
    alert(component.get('v.FirstName'));
    alert(component.get('v.LastName'));
   	}
})