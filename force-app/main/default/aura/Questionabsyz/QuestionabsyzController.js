({ 
    call : function(component, event, helper) {
         var myName = component.find("select"). get("v.value");
      
       component.set("v.selected","Thanks! you selected "+myName);
    }
    
})