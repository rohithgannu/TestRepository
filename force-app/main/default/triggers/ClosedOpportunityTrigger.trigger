trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    list<Task> opps=new list<Task>();
    for(Opportunity op: Trigger.new)
    {
       Task tas=new Task();
        tas.Subject='Follow Up Test Task';
        tas.WhatId=op.Id;
        opps.add(tas);
    }
insert opps;
}