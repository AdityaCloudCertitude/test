public class Trigger14Controller {

    public static void HandleInsert(List<Contact> NewLst)
    {
        set<Id> LstId = new Set<Id> ();
        for(Contact each : NewLst)
        {
            LstId.add(each.AccountId);
        }
        system.debug('List of contact Id is' + LstId);
        
        List<Account> LstAcc = new List<Account> ();
        LstAcc = [Select Id , name from Account where Id IN:LstId];
        system.debug('List of get accounts is '+ LstAcc);
        
        for(Account each : LstAcc)
        {
            each.Contact_Created__c = True;
        }
        Update LstAcc;
    }
}