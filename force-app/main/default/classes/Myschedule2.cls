global class Myschedule2 Implements Schedulable {
    global void execute(SchedulableContext SC){
        accountbatch b=new accountbatch();
        database.executeBatch(b);
    }

}