({
	 doInit : function(component, event, helper) {

                                var action = component.get("c.fetchAccountList");       

        action.setCallback(this, function(data){

            component.set("v.Accountlist",data.getReturnValue());

                          });       

        $A.enqueueAction(action);

	},
    
   click : function(component, event, helper){
        
        
        
        
        
    }
    
    
    
    
    
    
})