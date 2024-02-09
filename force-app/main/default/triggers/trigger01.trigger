trigger trigger01 on Contact  (after insert) {
    emailclass.emailupdate(trigger.new);

}