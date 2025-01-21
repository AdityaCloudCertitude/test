public class AccountTriggerHandler {

    public static void SendEmailWhenAccountDeleted (Set<Id> accountIdSet) 
       
    {
         system.debug('method called.');
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        List<String> toAddresses = new List<String>();
        
        List<Account> accLst = new List<Account>([Select ownerId  from Account where Id IN:accountIdSet]);
        system.debug('Acclist is ---> '+accLst);
        set<Id> LstUserID = new Set <ID> ();
        
        for(Account each : accLst)
        {
            LstUserID.add(each.ownerId);
        }
        system.debug('list of user id is ' + LstUserID);
        List<User> UserObjList = new List<User> ([select Email from User where Id IN:LstUserID]);
        
        system.debug('list of user object is the uuuuususususus ---> ' + UserObjList);
        for(User each  : UserObjList)
        {
            
            toAddresses.add(each.Email);
            system.debug('toAddresses ---- ' + toAddresses);
            if(toAddresses.size()>0)
            {
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setSenderDisplayName('Email Alert');
                mail.setSubject('Account Deleted');
                mail.setToAddresses(toAddresses);
                mail.setHtmlBody('Your Account Has Been Deleted');
                mails.add(mail);
                system.debug('mails----' + mails);
            }
        }
        Messaging.SendEmail(mails);
    }
}
