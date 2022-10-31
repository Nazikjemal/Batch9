trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete, after undelete) {

    if (Trigger.isBefore && Trigger.isInsert) {
        //call validation methods.
        ContactAccount.newContactonExistingAccount(Trigger.new);
    }

}