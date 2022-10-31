trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update) {
    if (Trigger.isAfter && Trigger.isInsert) {
        //create default salesforce ticket.
        SalesforceProjectTriggerHandler.createDefaultTicket(Trigger.New);
        //call future method.
        SalesforceProjectTriggerHandler.updateProjectDescription(trigger.newmap.keySet());
    }
    if(trigger.isBefore && Trigger.isUpdate){
        SalesforceProjectTriggerHandler.validateProjectCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}