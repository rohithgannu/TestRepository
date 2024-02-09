({
	showmsg : function(component, event, helper) {
        var evt= $A.get("e.c:NavigateToC2");
        evt.setParams({ "result": event.getSource().get("v.label")});
      evt.fire();
		
	}
})