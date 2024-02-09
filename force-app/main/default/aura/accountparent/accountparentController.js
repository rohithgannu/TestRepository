({
	deletedetails : function(component, event, helper) {
        
		var cmpEvent = component.getEvent("cmpEvent");
        cmpEvent.setParams({
            "deleteacc" : component.get("v.accs")
             });
        cmpEvent.fire();
	}
})