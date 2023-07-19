trigger AccountTrigger on Account (before insert, before Update, before delete , after insert , after update , after delete , after undelete) 
{
    // Scenario 1: send email to owner when account is deleted.
    // Event : after 
    // operation : delete
    if(Trigger.isBefore && Trigger.isdelete){
        system.debug('trigger run1');
        Set<Id> accountIdSet = new Set<Id>();
        for(Account acc : Trigger.old){
            accountIdSet.add(acc.Id);
            system.debug('accountIdSet---' + accountIdSet);
        }
        if(!accountIdSet.isEmpty()){
            system.debug('last line');
            AccountTriggerHandler.SendEmailWhenAccountDeleted(accountIdSet); 
            system.debug('20');
        }
    }
}