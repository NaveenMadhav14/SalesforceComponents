public class ContactsCountOnAccount {
    Public static void NoOfContacts(List<Contact> listOfContacts){
        system.debug('listOfContacts :'+listOfContacts);
        set<Id> AccountIds=new set<Id>();
        for(Contact cont: listOfContacts){
            AccountIds.add(cont.AccountId);
        }
        
        List<Account> accList=new List<Account>();
        List<Account> accountList=[SELECT Name,Number_of_Contacts__c,(SELECT LastName FROM Contacts WHERE AccountID IN: AccountIds) FROM Account ];
        system.debug('accountList :'+accountList);
        for(Account ac: accountList){
            Account acc=new Account();
            acc.Id=ac.Id;
            acc.Number_of_Contacts__c=ac.contacts.Size();
            accList.add(acc);
            system.debug('ac.contacts.Size() :'+ac.contacts.Size());
        }
        update accList;
    }
}