trigger PaymenysTrigger on Payments__c(after insert, after update, after delete) {

    if(Trigger.isAfter){
        if(Trigger.isInsert){
            PaymenysTriggerHandler.insertPayments(trigger.New);
        }
        if(Trigger.isUpdate){
            PaymenysTriggerHandler.updatePayments(Trigger.new, Trigger.oldMap);
        }
        if(Trigger.isDelete){
            PaymenysTriggerHandler.deletePayments(trigger.Old);
        }
    }
}