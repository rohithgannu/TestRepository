({
	myAction : function(component, event, helper) {
			var action =component.get("c.getAllAccounts");
        console.log('The action value is: '+action);
         action.setCallback(this, function(a){ 
             
            component.set("v.accounts", a.getReturnValue());
           
            console.log('The accs are :'+JSON.stringify(a.getReturnValue()));
          
        });
        $A.enqueueAction(action);
	}
	}
)