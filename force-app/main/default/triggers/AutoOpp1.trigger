trigger AutoOpp1 on Account(after insert) {

List<Case> newOpps = new List<Case>();
  for (Account acc : Trigger.new ) {
    Case opp = new Case();
   
    opp.Status   = 'Working';
    
    opp.AccountId   = acc.Id; // Use the trigger record's ID
    newOpps.add(opp);
  }
  insert newOpps;
}