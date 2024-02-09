({
    doInit: function(component, event, helper) {
        var action = component.get("c.getItems");
        alert(action);
       action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
            component.set("v.Items",response.getReturnValue());
        }
    
       });
        $A.enqueueAction(action);
    },
   handleAddItem: function(component, event, helper) {
       var newItem = event.getParam("item");
    var action = component.get("c.saveItem");
    		action.setParams({"item": newItem});
    		action.setCallback(this, function(response){
        		var state = response.getState();
        		if (component.isValid() && state === "SUCCESS") {
            		// all good, nothing to do.
            var items = component.get("v.Items");
           items.push(item);
           component.set("v.Items",items);
        		}
    		});
    		$A.enqueueAction(action);
        		}
   
})