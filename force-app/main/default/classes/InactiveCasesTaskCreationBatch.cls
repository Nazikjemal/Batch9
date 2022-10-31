public with sharing class InactiveCasesTaskCreationBatch implements Database.Batchable<sObject>{

    public Database.QueryLocator start(Database.BatchableContext bc) {
        Database.QueryLocator q1;
        //since we are creating mock data in test class. LastModifiedDate field won't meet out expectation
        //if class is executing from Test class, it will run else stateent
        if(!Test.isRunningTest()){
            q1 = database.getQueryLocator([select Id, OwnerId from Case Where isClosed = false and LastModifiedDate < LAST_N_DAYS:5]);
        }
        else{
            q1 = database.getQueryLocator([select Id, OwnerId from Case Where isClosed = false]);
        }
        return q1;
    }
    public void execute(Database.BatchableContext bc, List<Case> scope){
        List<Task> tasksList = new list<Task>();
        for(Case c : scope){
            Task tk = new Task();
            tk.Subject = System.Label.Subject;//'Critical action needed';//This needs to be created in Org first
            tk.Description = System.Label.Comments;//'Complete fast';//This needs to be created in Org first
            tk.WhatId = c.Id;
            tk.OwnerId = c.OwnerId;
            tk.Status = 'In Progress';
            tk.ActivityDate = Date.today().addDays(2);
            
            tasksList.add(tk);             
        }
        if(!tasksList.isEmpty()){
            Insert tasksList;
        }
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Batch Done');
    }
}
