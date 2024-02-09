trigger deadaccounttrigger1 on contact (after insert,after update) {
    deadaccount.DeadAccount1(trigger.new);

}