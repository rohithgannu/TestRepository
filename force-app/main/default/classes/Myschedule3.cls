global class Myschedule3 Implements Schedulable {
    global void execute(SchedulableContext SC){
        Lineitemdelete b=new Lineitemdelete ();
        database.executeBatch(b);
    }

}