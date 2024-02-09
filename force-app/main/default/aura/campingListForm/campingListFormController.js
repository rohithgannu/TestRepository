({
    clickCreateItem: function(component, event, helper) {
        var validCamping = component.find('f').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if(validCamping){
            var addItm = event.getParam("v.newItem");
            helper.createItem(component, addItm);
        }
    }
})