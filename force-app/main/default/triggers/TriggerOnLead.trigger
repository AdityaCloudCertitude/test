trigger TriggerOnLead on Lead (before insert) {
    
    if(Trigger.isBefore && Trigger.isInsert)
    {
        TriggerOnLeadController.BeforeInsertMethod(Trigger.new);
    }

}