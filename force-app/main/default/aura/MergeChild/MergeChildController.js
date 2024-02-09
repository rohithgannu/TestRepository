({
    init : function(component, event, helper) {
        component.set("v.fieldValue",component.get("v.field")[component.get("v.fieldLabel")]);
        
    },
    
    onChange : function(component,event,helper){
        var changedValue = event.getSource().get("v.value");
        var fieldLabel = component.get("v.fieldLabel");
        var masterData = component.get("v.masterData");
        masterData[fieldLabel] = changedValue;
        //console.log('data-->'+JSON.stringify(dupData))
        component.getEvent("mergeEventData").setParams({
            "master" : masterData
            
        }).fire();
        
    }
    
    
})