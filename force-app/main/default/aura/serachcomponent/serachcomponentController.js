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

    },
 

	search1 : function(component, event, helper) {
        var cmpEvent1 = component.get("cmpEvent");
        cmpEvent1.setParams({
            "contact1" : component.get("v.contacts")
             });
        cmpEvent1.fire();
		
    }
}
 )