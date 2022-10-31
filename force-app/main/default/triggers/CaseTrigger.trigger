trigger CaseTrigger on Case (before insert, after insert, before update, after update, before delete, after delete) {

    if(trigger.isBefore && trigger.isInsert){
        System.debug('Before insert Case');
    }
    if(trigger.isAfter && trigger.isInsert){
        System.debug('After insert Case');
    }
    if(trigger.isBefore && trigger.isUpdate){
        System.debug('Before update Case');
    }
    if(trigger.isAfter && trigger.isUpdate){
        System.debug('After update Case');
    }
    if(trigger.isBefore && trigger.isDelete){
        System.debug('Before delete Case');
    }
    if(trigger.isAfter && trigger.isDelete){
        System.debug('After delete Case');
    }

}