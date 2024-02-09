trigger abhandlertrigger on B__c (before insert,before update) {
    
    abhandler.m(trigger.new);

}