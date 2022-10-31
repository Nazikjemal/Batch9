@isTest
public class InactiveCasesTaskCreationTest {
    @istest static void testBatch() {
        List<Case> listCase = new List<Case>();
        for(Integer i = 0 ; i < 200 ; i++){
            Case c = new Case();
            c.Status = 'New';
            c.Origin = 'Phone';
            listCase.add(c);
        }
        insert listCase;

        Test.starttest();
        InactiveCasesTaskCreationBatch btc = new InactiveCasesTaskCreationBatch();
        Id batchId = Database.executeBatch(btc, 200);
        Test.stoptest();

        List<Task> taskList = [SELECT id FROM Task];
        System.assertEquals(200, taskList.size());

        AsyncApexJob batchJob = [SELECT id, Status, Apexclass.name, JobType FROM AsyncApexJob WHERE id = : batchId];
        System.assertEquals('InactiveCasesTaskCreationBatch', batchJob.Apexclass.name);
        System.assertEquals('BatchApex', batchJob.JobType);
        System.assertEquals('Completed', batchJob.Status);
    }

    @isTest static void testScheduler(){
        // Test data not needed, because we're not testing Apex Batch results
        // That will be tested somewhere else

        // Verify that AsyncApexJob is empty
        // not strictly necessary but makes what is going on later clearer

        List<AsyncApexJob> jobsBefore = [select Id, ApexClassID, ApexClass.Name, Status, JobType from AsyncApexJob];
        System.assertEquals(0, jobsBefore.size(), 'not expecting any asyncjobs');

        Test.starttest();
        InactiveCasesTaskCreationScheduler schClass = new InactiveCasesTaskCreationScheduler();
        String cronExp = '0 0 1 1/1 * ? *';
        Id jobID = System.schedule('Create Task for Cases'+System.now(), cronExp, schClass);
        Test.stoptest();

        // There will now be two things in AsyncApexJob - the Schedulable itself
        // and also the Batch Apex job. This code looks for both of them

        // Check schedulable is in the job list
        List<AsyncApexJob> jobsScheduled = [select Id, ApexClassID, ApexClass.Name, Status, JobType from AsyncApexJob where JobType = 'ScheduledApex'];
        System.assertEquals(1, jobsScheduled.size(), 'expecting one scheduled job');
        System.assertEquals('InactiveCasesTaskCreationScheduler', jobsScheduled[0].ApexClass.Name, 'expecting specific scheduled job');
        System.assertEquals('Queued', jobsScheduled[0].Status);

        // check apex batch is in the job list
        List<AsyncApexJob> jobsApexBatch = [select Id, ApexClassID, ApexClass.Name, Status, JobType from AsyncApexJob where JobType = 'BatchApex'];
        System.assertEquals(1, jobsApexBatch.size(), 'expecting one apex batch job');
        System.assertEquals('InactiveCasesTaskCreationBatch', jobsApexBatch[0].ApexClass.Name, 'expecting specific batch job');
    }

    @isTest static void testSchedulerOption2(){
       
        Test.starttest();
        InactiveCasesTaskCreationScheduler schClass = new InactiveCasesTaskCreationScheduler();
        String cronExp = '0 0 1 1/1 * ? *';
        Id jobID = System.schedule('Create Task for Cases', cronExp, schClass);
        Test.stoptest();

        CronTrigger ct = [SELECT TimesTriggered, NextFireTime, State, CronJobDetail.JobType, CronJobDetail.Name FROM CronTrigger WHERE Id = :jobID];
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals('Create Task for Cases', ct.CronJobDetail.Name);


    }


}
