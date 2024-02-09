({
	getInput : function(component, event, helper) {
	var add=parseInt(component.get("v.name1"))+	parseInt(component.get("v.name2"));
        component.set("v.sum",add);
	}
})