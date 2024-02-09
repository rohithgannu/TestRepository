({
	myAction : function(component, event, helper) {
		var action =component.get("c.oppdetails");
        console.log('The action value is: '+action);
         action.setCallback(this, function(a){ 
             
            component.set("v.opps",a.getReturnValue());
           //  console.log('The accs are :'+JSON.stringify(a.getReturnValue()));
            console.log('The accs are :'+JSON.stringify(a.getReturnValue()));
          
        });
        $A.enqueueAction(action);
	
	},
     handleComponentEvent : function(cmp, event) {
        var message = event.getParam("opportunity1");

        // set the handler attributes based on event data
        cmp.set("v.messageFromEvent", message);
      }
})