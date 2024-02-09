({
getContactLst : function(component, event, helper) {

       var action = component.get('c.fetchLead');
       action.setCallback(this, function(response) {
        
         var state = response.getState();
      if (state === "SUCCESS") {
       
       component.set('v.ListOfLead', response.getReturnValue());
      }
    });
       $A.enqueueAction(action);
},
  
 
    showSpinner: function(component, event, helper) {
      
        component.set("v.Spinner", true); 
   },
    
  
    hideSpinner : function(component,event,helper){
       
       component.set("v.Spinner", false);
    }
    
})