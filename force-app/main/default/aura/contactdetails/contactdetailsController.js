({
	doInit: function(component, event, helper) {
       
        var action = component.get("c.condetails1"); 
        alert(action);
         var con=component.get("v.contacts");
        action.setParams({
            "cont" :con
        });

        action.setCallback(this, function(data){

            component.set("v.contacts",data.getReturnValue());
            console.log("The cons are :"+JSON.stringify(data.getReturnValue()));

                          });       

        $A.enqueueAction(action);

    }}
)