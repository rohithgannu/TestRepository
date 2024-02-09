({
	showToast : function(component, event, helper) {
       var sMsg='required fields cannot be null';
       var sMsg1='records are validated';
        var toastEvent= $A.get("e.force:showToast");
        var toastEve= $A.get("e.force:showToast");
        toastEvent.setParams({
            mode: 'sticky',
            message: sMsg,
            type : 'error'
        });
        toastEve.setParams({
            mode: 'sticky',
            message: sMsg1,
            type : 'success'
        }); 
        
        var phn= component.get("v.phone");
		 var phoneNumcheck = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/; 
        
      if((component.get("v.text")==null) || (component.get("v.text1")==null) ||(component.get("v.selected")==null)||(!phn.match(phoneNumcheck)) )  
    
        toastEvent.fire();
        
        else
        {
            toastEve.fire();
        }
        
    }
}
 )