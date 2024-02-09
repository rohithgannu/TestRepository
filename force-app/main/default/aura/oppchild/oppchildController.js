({
	oppclick : function(component, event, helper) {
        alert('entered')
        alert(component.get("v.opps.Name"))
        var cmpEvent = component.getEvent("cmpEvent");
        cmpEvent.setParams({
            "opportunity1" : component.get("v.opps.Name")
             });
        cmpEvent.fire();
		
	}
})