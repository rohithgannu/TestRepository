({
	myAction : function(component, event, helper) {
     var myName = component.find("name").get("v.value");
       
 
        var myText = component.find("outName");
        var greet =myName;
        myText.set("v.value", greet);
		
	}
})