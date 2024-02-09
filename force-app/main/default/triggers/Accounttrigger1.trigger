trigger Accounttrigger1 on Account (before insert,before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        Accountriggerclass.method(Trigger.new);
    }
}