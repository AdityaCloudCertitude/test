trigger Trigger14 on Contact (after insert) {
    
    Trigger14Controller.HandleInsert(Trigger.New);
}