({
	myAction : function(component, event, helper) {
        
		  var action =component.get("c.accdetails");
        console.log('The action value is: '+action);
         action.setCallback(this, function(a){ 
             
            component.set("v.Accounts", a.getReturnValue());
           //  console.log('The accs are :'+JSON.stringify(a.getReturnValue()));
            console.log('The accs are :'+JSON.stringify(a.getReturnValue()));
          
        });
        $A.enqueueAction(action);
	},
    handleComponentEvent:function(component, event, helper) {
        
        
        var message = event.getParam("deleteacc");
         var action = component.get("c.deletedetails1");

    action.setParams({
        "accid" :message
    });

    action.setCallback(this, function(a) {
        if (a.getState() === "SUCCESS") {
            alert('deleted')
        } else if (a.getState() === "ERROR") {
            $A.log("Errors", a.getError());
        }
    });

    $A.enqueueAction(action);

        
    }
})