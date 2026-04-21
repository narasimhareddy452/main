({
	invoke : function(component, event, helper) {
	       var salary=component.get("v.salary");
           console.log('Salary is:'+salary);
           var exp=component.get("v.exp");
        bonus=0;
        console.log('Exp is:'+exp);
        if(exp>5){
            bonus=Salary*.30;
        }else
        {
           bonus=Salary*.20;
       }
       component.set("v.bonus",bonus);
       console.log('Bonus is:'+bonus); 
	}
})