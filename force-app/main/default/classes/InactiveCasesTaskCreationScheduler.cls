public with sharing class InactiveCasesTaskCreationScheduler implements Schedulable {  
    public static void execute(SchedulableContext sc){
       Database.executeBatch(new InactiveCasesTaskCreationBatch());
    }
}
