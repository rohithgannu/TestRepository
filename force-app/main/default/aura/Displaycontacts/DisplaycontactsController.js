({

                doInit : function(component, event, helper) {

                                var action = component.get("c.fetchContactList1");       

        action.setCallback(this, function(data){

            component.set("v.ContactList",data.getReturnValue());

                          });       

        $A.enqueueAction(action);

                }

})