trigger triggerbatch on Batch__c (before update) {
batchtriggerhandler.m(trigger.new);    
    

}