({
    display : function(component, event, helper) {
       var action =component.get("c.condetails");
       
        console.log('The action value is: '+action);
       
         action.setCallback(this, function(a){              
            component.set("v.cont", a.getReturnValue());
         
        
            console.log('The cons are :'+JSON.stringify(a.getReturnValue()));          
        });
         component.set("v.isOpen", true); 
        $A.enqueueAction(action);
    }, 
     
      closeModel: function(component, event, helper) {
         component.set("v.isOpen", false);
         // for Hide/Close Model,set the "isOpen" attribute to "Fasle"        
      },
    createnew: function(component, event, helper){
        component.set("v.isTrue",true);
    },
    save: function(component, event, helper){
        var newcon = component.get("v.newcontact");
     
        var action=component.get("c.save");
        newcon.sobjectType='Contact';
            action.setParams({ 
                "con": newcon
            });
            
            action.setCallback(this, function(a) {
                var state = a.getState();
                
                if (state === "SUCCESS") {
                    var name = a.getReturnValue();
                    alert("success");
                }
                else
                {
                    alert("Failed"+state);
                }
            });
            $A.enqueueAction(action)
        },
    removeCSS: function(cmp, event) {
        var cmpTarget = cmp.find('btnCancel');
        $A.util.removeClass(cmpTarget, 'slds-modal__container');
    }

    
})