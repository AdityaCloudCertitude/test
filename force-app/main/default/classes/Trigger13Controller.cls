public class Trigger13Controller {

   Public static void HandleUpsert(List<Account> NewLst)
    {
		Set<Id> SetOfUser = new Set<Id>();
        for(Account each : NewLst)
        {
            SetOfUser.add(each.OwnerId);
        }
        system.debug('SET OF ID IS '+SetOfUser);
        
        Map<Id,User>MapUser = new Map<Id,User>([select Name from User where id in:SetOfUser]);
         for(Account Acc: NewLst)
         {
          User Temp = MapUser.get(Acc.OwnerId);
            Acc.Sales_Rep__c=Temp.Name;
          }
        
    }
}