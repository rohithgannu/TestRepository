({
	packItem : function(component, event, helper) {
          var btn= event.getSource();
        var BtnMessage =btn.get("v.label");
        component.set("v.item","Packed");
        
        var btnClicked = event.getSource();
        component.set("v.item.Packed__c",true);
           
       
        
		
	}
})