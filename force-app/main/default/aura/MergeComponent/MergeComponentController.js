({
    init : function(component, event, helper) {
        var pageReference = component.get("v.pageReference");
        component.set("v.recordId", pageReference.state.c__recordId);
        component.set("v.openEditSiteModal", true);  
        helper.getData(component, event, helper); 
        
        
    },
    
    handleChange: function (component, event, helper) {
        // This will contain an array of the "value" attribute of the selected options
        var listofValues =[];
        var selectedOptionValue = event.getParam('value');
        var labels = component.get("v.options");  
        var labelList =[];
        for(var i=0;i<selectedOptionValue.length;i++){
            for(var j=0;j<labels.length;j++){
                if(labels[j].value == selectedOptionValue[i]){
                    var item ={
                        'label' : labels[j].label,
                        'fieldName' : labels[j].value
                    }
                    labelList.push(item);
                }
            }
        }
        for(var i=0;i<selectedOptionValue.length;i++){
            var item={
                'label' : selectedOptionValue[i],
                'fieldName' : selectedOptionValue[i] 
            }
            listofValues.push(item); 
        }
        component.set("v.columns",labelList);
        
    },
    
    hideModal :function (component, event, helper) {
        
        helper.hideModal(component, event, helper);
        
    },
    
    handleRowAction : function (component, event, helper){
        
        
        var selectedRows = event.getParam('selectedRows'); 
        var setRows = [];
        for ( var i = 0; i < selectedRows.length; i++ ) {
            
            setRows.push(selectedRows[i]);
            
        }
        component.set("v.excludeData",setRows);
        component.set("v.masterData",setRows[0]);
       
        
        if(selectedRows.length >=2){
            component.set("v.disabledValue",false);
        }
        else{
            component.set("v.disabledValue",true);
        }
        
        var selected = [];
        selectedRows.forEach(function(file) {
            selected.push(file.Id);
        });  
        component.set("v.selectedRows",selected);
    },
    
    nextDetails :  function (component, event, helper){
       
        var excludeData = component.get("v.excludeData");
         var data =[];
        for(var i=0;i<excludeData.length;i++){
            data.push(excludeData[i]);
        }
       
        component.set("v.masterData",data[0]);
        
        var data1 = component.get("v.data");
         var datalist =[];
        for(var i=0;i<data1.length;i++){
            datalist.push(data1[i]);
        }
        component.set("v.excludeData1",datalist);
        component.set("v.onNext",false);
        component.set("v.onMerge",true);
        
        component.set("v.ProgressBar",'step-2');
        var selected = [];
        component.set("v.selectedMergeRows",selected);
        if(selected.length == 1){
            component.set("v.disableMerge",false);
        }
        else{
            component.set("v.disableMerge",true);
        }
        
        $(".scrollContent").scrollTop(0);
        
    },
    
    getBack: function (component, event, helper){
        component.set("v.onNext",true);
        component.set("v.onMerge",false);
        component.set("v.ProgressBar",'step-1');
          //var data = component.get("v.excludeData1");
          //component.set("v.data",data);
        helper.getData(component, event, helper);  
    },
    
    updateSelectedText  : function(component,event, helper){
        var selectedRows = event.getParam('selectedRows'); 
        component.set("v.masterAccount",selectedRows);
        
        var selected = [];
        selectedRows.forEach(function(file) {
            selected.push(file.Id);
        });  
       
        component.set("v.selectedMergeRows",selected);
        
        if(selected.length == 1){
            component.set("v.disableMerge",false);
        }
        else{
            component.set("v.disableMerge",true);
        }
    },
    
    onMasterChange : function(component,event,helper){       
        var value =event.getSource().get("v.value");
        component.set("v.masterId",value);
        
        
    },
    
    getMergeData :function(component,event,helper){
        var master = event.getParam("master");
        console.log('master-->'+JSON.stringify(master)) 
    },
    
    saveDetails : function(component,event, helper){
        component.set("v.showSpinner",true);
        var master = component.get("v.masterData");
        var masterId = component.get("v.masterId");
        if(masterId == null || masterId == undefined){
          
            var mId = master.Id;
            component.set("v.masterId",mId);
        }
        var mastrId = component.get("v.masterId");
        let excludeData = component.get("v.excludeData");
        
        var recordName = component.get("v.recordName");
        var duplicateData = [];
        for(var i=0;i<excludeData.length;i++){
         
            if(mastrId == excludeData[i].Id){
               //
            }
            else{
                
                duplicateData.push(excludeData[i].Id);
            }
        }
        
      
        var action = component.get("c.mergeData");
        action.setParams({
            'master' : master,
            'acc' : component.get("v.masterId"),
            'records' : duplicateData,
            'recordName' :recordName
            
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state == 'SUCCESS') { 
                var result = response.getReturnValue();
             
                if(result!=null){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Success!",
                        "type" : "success",
                        "message": "The Master record has been updated & an email will be send to you with the result."
                    });
                    toastEvent.fire();
                    helper.hideModal(component, event, helper);
                }
                else{
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Failed!",
                        "type" : "error",
                        "message": "Duplicates are empty"
                    });
                    toastEvent.fire();
                }
            }
            else{
                console.log('error')
            }
            component.set("v.showSpinner",false);
        });
        $A.enqueueAction(action);
        
        
        
    },
    
    
    
})