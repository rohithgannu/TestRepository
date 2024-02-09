trigger Leadtrigger on Lead (before insert,before update) {
    if(trigger.isbefore && trigger.isinsert){
    Leadtriggerhandler.method(trigger.new);
    }
    if(trigger.isBefore && trigger.isupdate){
     Leadtriggerhandler.method2(trigger.oldMap,trigger.New);   
    }
}