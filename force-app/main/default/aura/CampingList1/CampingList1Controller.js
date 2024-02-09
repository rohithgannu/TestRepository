({
    clickCreateItem: function(component, event, helper) {
        var valid= component.find('f').reduce(function (validSoFar, inputCmp) {
         
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(valid){
            // Create the new expense
            var item =JSON.parse(JSON.stringify(component.get("v.newItem")));
            var itemm=JSON.parse(JSON.stringify(component.get("v.Items")));
        
            itemm.push(item);
            component.set("v.Items",itemm);
component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
'Price__c': 0,'Packed__c': false });
        }
    }
})