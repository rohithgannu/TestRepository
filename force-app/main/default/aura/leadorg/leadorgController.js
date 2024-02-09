({
	save : function(component, event, helper) {
		
         var candidate1 = component.get("v.candidate");
         var action = component.get("c.createRecord");
          action.setParams({
           "Lead1" : candidate1
        });
        
       
        action.setCallback(this,function(response){
            
            var state = response.getState();
            
            
            if(state === "SUCCESS"){
                var name = response.getReturnValue();
                alert("Record is Created Successfully");
            } 
            else {
                alert("Error in calling server side action");
            }
        });
        
		    
        $A.enqueueAction(action);

    }
})