({
	myAction : function(component, event, helper) {
       
                                var action = component.get("c.accdetails");       

        action.setCallback(this, function(data){

            component.set("v.Accounts",data.getReturnValue());
            console.log("The accs are :"+JSON.stringify(data.getReturnValue()));

                          });       

        $A.enqueueAction(action);

	}
})