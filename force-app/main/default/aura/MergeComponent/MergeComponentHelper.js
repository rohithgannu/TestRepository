({
    getData : function(component, event, helper) {
        
        var recordId = component.get("v.recordId");
        component.set("v.showSpinner",true);
        var action = component.get("c.getData");
        action.setParams({
            "recordId" : recordId
            
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state == 'SUCCESS') { 
                
                var result = response.getReturnValue();
                for(var i=0;i<result.accountList.length;i++){
                    for(var j=0;j<result.accountfields.length;j++){
                        if(result.accountfields[j].includes('.')){
                            
                            if(result.accountList[i][result.accountfields[j].split('.')[0]]!==undefined){
                                var newfield = result.accountfields[j].replace('.','');
                                
                                result.accountList[i][newfield] =  result.accountList[i][result.accountfields[j].split('.')[0]][result.accountfields[j].split('.')[1]];
                                
                                
                            }
                        }
                    }
                    
                }
             
                component.set("v.data",result.accountList);
                let excludeData = component.get("v.data");
                component.set("v.excludeData",result.accountList);
                
                if(excludeData.length >=2){
                    component.set("v.disabledValue",false);
                }
                else{
                    component.set("v.disabledValue",true);
                }
                
               
                //component.set("v.masterData",result.accountList[0]);
                //component.set("v.masterDataSample",result.accountList[0]);
                component.set("v.sobjectLabel",result.objectLabel);
                component.set("v.recordName",result.recordName);
                component.set("v.countofValues",result.accountList.length); 
                var selected = [];
                result.accountList.forEach(function(file) {
                    
                    selected.push(file.Id);
                });  
                component.set("v.selectedRows",selected);
                this.getValues(component, event, helper);
                
            }
            else{
                
            }
            
        });
        $A.enqueueAction(action);
        
    },
    
    getValues : function(component, event, helper) {
        
        var listOptions=[];
        var listofvalues=[];
        var preSelectedValues =[];
    
        var recordId = component.get("v.recordId");
        component.set("v.showSpinner",true);
        var action = component.get("c.getValues");
        action.setParams({
            "recordId" : recordId
            
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            var ex=[];
            if(state == 'SUCCESS') { 
                var result = response.getReturnValue();
                for(var i=0;i<result.length;i++){
                 
                    let preparedAddress = {};
                    
                    if(result[i].fieldNames.includes('.')){
                        var newfieldvalue = result[i].fieldNames.replace('.','');
                        
                        var item = {
                            "label": result[i].fieldLables,
                            "value":  newfieldvalue
                        };
                        listOptions.push(item);
                    }
                    else{
                        
                        
                        var item = {
                            "label": result[i].fieldLables,
                            "value":result[i].fieldNames
                        };
                        listOptions.push(item);
                        
                    }
                    
                    if(result[i].columnLabel!=null &&result[i].columnField!=null ){
                        if(result[i].columnField.includes('.')){
                          
                            var newfieldvalue = result[i].columnField.replace('.','');
                            var newfieldvalue1 = result[i].columnField.replace('.',' ');
                          
                            var item = {
                                "label": result[i].columnLabel,
                                "fieldName":  newfieldvalue,
                                //"type": 'url', "typeAttributes": { label: { fieldName: newfieldvalue },target: '_blank' }
                            };
                            listofvalues.push(item);
                            preSelectedValues.push(item.fieldName);    
                        }
                        else{
                            var column = {
                                "label": result[i].columnLabel,
                                "fieldName":result[i].columnField
                            };
                            listofvalues.push(column);
                            preSelectedValues.push(column.fieldName);    
                        }
                        
                    }
                }
               
                component.set("v.options",listOptions);
                component.set("v.columns",listofvalues);
                component.set("v.preSelectedValues",preSelectedValues);
              
                
                if(listofvalues.length==0){
                    component.set("v.columns",[{label:'Name',fieldName:'Name'},
                                               {label:'Created By' ,fieldName:'CreatedByName'},
                                               {label:'Owner',fieldName:'OwnerName'},
                                               {label:'Created Date',fieldName:'CreatedDate'}
                                              ]);  
                    var listofColumns = component.get("v.columns");
                    var prelist =[];
                    for(var j=0;j<listofColumns.length;j++){
                        prelist.push(listofColumns[j].fieldName);
                    }
                    component.set("v.preSelectedValues",prelist);
                }
               
            }
            else{
                console.log('error')
            }
            component.set("v.showSpinner",false);
        });
        $A.enqueueAction(action);
        
        
    },
    
    
    hideModal : function(component, event, helper) {
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": component.get("v.recordId")
            
        });
        navEvt.fire(); 
        $A.get('e.force:refreshView').fire();
    }
    
    
    
    
})