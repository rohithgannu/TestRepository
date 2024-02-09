public class BulkMergeClass {
    public static Boolean isMerge;
    public class wrapperClass{
        @AuraEnabled public String fieldNames{get;set;}
        @AuraEnabled public String fieldLables{get;set;}
        @AuraEnabled public String columnField{get;set;}
        @AuraEnabled public String columnLabel{get;set;}
    }
    
   //Method is used to get the fieldNames and Custom metadata of Particular Object 
    @AuraEnabled
    public static  List<wrapperClass> getValues(string recordId){
        List<wrapperClass> wrapList = new List<wrapperClass>();
        List<String> fieldsList = new  List<String>();
        
        DuplicateRecordSet records = [select Id,name,(select Id,name,recordId from DuplicateRecordItems) from DuplicateRecordSet where Id=:recordId];
        List<Id> accountIds = new List<Id>();
        for(DuplicateRecordItem record : records.DuplicateRecordItems){
            accountIds.add(record.recordId);
        }
        Id sId = accountIds[0];
        String sobjectType = sId.getSObjectType().getDescribe().getName();
        Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Map <String, Schema.SObjectField> MapofdesiredObject = schemaMap.get(sobjectType).getDescribe().fields.getMap();
        
        List<Merge_Table_Columns__mdt> metdata = [select MasterLabel,Field_Name__c,SobjectName__c from Merge_Table_Columns__mdt where  SobjectName__c=:sobjectType];
        
        for(Schema.SObjectField sObjectfield : MapofdesiredObject.Values())
        {
            schema.describefieldresult dfield = sObjectfield.getDescribe();
            
            wrapperClass wrap = new wrapperClass();
            if(dfield.getType() == Schema.DisplayType.Reference){
                String getName = dfield.getname();
                String getLabel = dfield.getLabel();
                
                if(getName.contains('Id')){
                    getName = getName.replace('Id', '.Name');
                    
                }
                else if(getName.contains('__c')){
                    getName = getName.replace('__c', '__r.Name');
                    
                }
                
                wrap.fieldNames = getName;
                wrap.fieldLables = getLabel;         
            }
            else{
                wrap.fieldNames = dfield.getname();
                wrap.fieldLables = dfield.getLabel();
            }
            
            
            
            for(Merge_Table_Columns__mdt mdt : metdata){
                if(mdt.Field_Name__c ==  wrap.fieldNames){
                    wrap.columnField =  wrap.fieldNames;
                    wrap.columnLabel = dfield.getLabel();
                }
            }
            
            wrapList.add(wrap);
            
        }
        
        return wrapList;
    }
    
    public class wrapper{
        @AuraEnabled public List<Sobject> accountList{get;set;}
        @AuraEnabled public List<String> accountfields{get;set;} 
        @AuraEnabled public String objectLabel{get;set;}
        @AuraEnabled public String recordName{get;set;} 
    }
    
     //Method is used to get the fieldValues for fieldnames of Particular Object  
    @AuraEnabled
    public static  wrapper getData(string recordId){
        wrapper wrapp = new wrapper();
        SObject obj;
        
        DuplicateRecordSet records = [select Id,name,(select Id,name,recordId from DuplicateRecordItems) from DuplicateRecordSet where Id=:recordId];
        wrapp.recordName = records.Name;
        List<Id> accountIds = new List<Id>();
        for(DuplicateRecordItem record : records.DuplicateRecordItems){
            accountIds.add(record.recordId);
        }
        Id sId = accountIds[0];
        String sobjectType = sId.getSObjectType().getDescribe().getName();
        obj = Schema.getGlobalDescribe().get(sobjectType).newSObject();
        DescribeSObjectResult describeResult = obj.getSObjectType().getDescribe();
        
        
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(sobjectType);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        
        List<String> fieldNames = new List<String>();
        for(Schema.SObjectField sObjectfield : fieldMap.Values())
        {
            schema.describefieldresult dfield = sObjectfield.getDescribe();
            fieldNames.add(dfield.getName());
        }
        
        List<String> updatedfieldNames = new List<String>();
        for(String fieldName : fieldNames){
            
            if( fieldMap.get(fieldName).getDescribe().getType() == Schema.DisplayType.Reference) {
                
                if(fieldName.contains('Id')){
                    
                    fieldName = fieldName.replace('Id', '.Name');
                    
                }
                else if(fieldName.contains('__c')){
                    fieldName = fieldName.replace('__c', '__r.Name');
                }
            }
            
            updatedfieldNames.add(fieldName);
        }
        
        String query =	  ' SELECT ' +	      String.join( updatedfieldNames, ',' ) +	  ' FROM ' +	      describeResult.getName() + ' WHERE ' + ' id = :accountIds ORDER BY CreatedDate ASC';	
        // return generic list of sobjects or typecast to expected type	List<SObject> records = Database.query( query );	
        List<Sobject> queryList = Database.query( query );
        
        wrapp.accountList =queryList;
        wrapp.accountfields = updatedfieldNames;
        wrapp.objectLabel =describeResult.getLabel();
        return wrapp;
    }
    
    //method to merge the Data
    @AuraEnabled
    public static string mergeData(SObject master,Id acc,List<Id> records,string recordName){
        
        
        
        List<Id> ids = new List<Id>();
        
        
        for(Id accList : records) {
            
            ids.add(acclist);
            
            if(ids.size() == 150){
                mergeRecords(acc,ids,recordName,records.size());
                ids.clear();
            }
        }
        
        if(!ids.isEmpty()){    
            mergeRecords(acc,ids,recordName,records.size());
        }
        else{
            return null;
        }
        
        if(master.Id!=null){
            master.Id = acc;
            update master;
        }
        return JSON.serialize(master);
    }
    
    //future method to perform Asynchronous Data merge of records
    @future
    public static void mergeRecords(Id acc,List<Id> idSet,String recordName,Integer size){
        Integer count=0; 
        
        try{
            Id sId = acc;
            String sobjectType = sId.getSObjectType().getDescribe().getName();
            sObject sObj = sId.getSObjectType().newSObject(sId) ;    
            
            
            for(Id i : idSet){
                
                Database.merge(sObj,i,true);
                count = count+1;
            }
            sendMailMethod('Successfully Completed',recordName,count); 
        }
        catch(Exception e){
            Integer countfail = 0;
            countfail = size - count;
            sendMailMethod('Successfully Completed',recordName,count); 
            sendMailMethod('Failed',recordName,countfail);
        }
        
    }
    
    //Send Email method to know the status of Success or Failure of merge records
    @AuraEnabled 
    public static void sendMailMethod(String Message,String recordName,Integer size){
        String mMail ;
        String mSubject = 'Merge Duplicate Records';
        String mbody = 'Hi ' + UserInfo.getFirstName() +', <br/><br/>'+ ' Your Merge Details for record:<b> ' + recordName +' </b>has been '+ Message +' with '+ size +' duplicate records';
        mMail = UserInfo.getUserEmail();
        
        List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();     
        
        // Step 1: Create a new Email
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        // Step 2: Set list of people who should get the email
        List<String> sendTo = new List<String>();
        sendTo.add(mMail);
        mail.setToAddresses(sendTo);
        
        // Step 3: Set who the email is sent from
        mail.setReplyTo('noreply@gmail.com'); // change it with your mail address.
        mail.setSenderDisplayName('salesforce User'); 
        
        // Step 4. Set email contents - you can use variables!
        mail.setSubject(mSubject);
        mail.setHtmlBody(mbody);
        
        // Step 5. Add your email to the master list
        mails.add(mail);
        
        // Step 6: Send all emails in the master list
        Messaging.sendEmail(mails);
    }   
}