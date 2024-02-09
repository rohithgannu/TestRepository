global class testclass Implements Schedulable {
    global void execute(SchedulableContext SC){
        batchclass1 b=new batchclass1();
        database.executeBatch(b);
    }
}