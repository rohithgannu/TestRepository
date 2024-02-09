({
	save : function(component, event, helper) {
		
         var case1 = component.get("v.case");
         var action = component.get("c.createcase");
        var phone1=component.find("Field1");
        var phn=phone1.get("v.value");
         var sMsg='phone number not in correct form';
             var toastEvent= $A.get("e.force:showToast");
          toastEvent.setParams({
              "ca": phn ,
            mode: 'sticky',
            message: sMsg,
            type : 'error'
        });
         if(isNaN(phn))
         { 
            
             toastEvent.fire();
             
         }
        else
        {
          action.setParams({
           "cas" : case1
        });
        
       
        action.setCallback(this,function(response){
            
            var state = response.getState();
            
            
            if(state === "SUCCESS"){
                var name = response.getReturnValue();
                if(name!=null)
                {
                    alert("phone number already existed");
                }
                else 
                    alert("record created succesfully");
            } 
            else {
                alert("Error in calling server side action");
            }
        });
        
		    
        $A.enqueueAction(action);

    }
    },
    handleChange : function(component, event, helper) {
  component.get("v.selectedVal");
 },
    cancel : function(component,event,helper){
        component.set("v.case" , {'sobjectType':'Case',
                         'Phone__c': '',
                         'Subject': '',
                         'Type': '', 
                         'Origin': '',
                      'Status':'', 
                                 });
                      }

})