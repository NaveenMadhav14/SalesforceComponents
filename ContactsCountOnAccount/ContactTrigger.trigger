trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {
if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete)){
     	ContactsOnAccount.NoOfContacts(Trigger.new);   
    }
    if(Trigger.isAfter && Trigger.isDelete){
     	ContactsOnAccount.NoOfContacts(Trigger.old);   
    }
}