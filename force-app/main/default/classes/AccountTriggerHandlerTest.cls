@isTest
public class AccountTriggerHandlerTest {
    @IsTest
    private static void testUpdateDescription() {
          //prepare data
       account acc1 = new account();
       acc1.Name = 'SI Test';
       acc1.Industry = 'Energy';
       acc1.Active__c = 'Yes';

       account acc2 = new account();
       acc2.Name = 'UI Test';
       acc2.Industry = 'Energy';

       account acc3 = new account();
       acc3.Name = 'PI Test';
       acc3.Industry = 'Banking';

       List<account> accList = new List<account> {acc1, acc2, acc3};
       insert accList;

       Test.startTest();

       Test.stopTest();

       //assertion
       list<account> resultAcc = [select id, name, active__c, Description from account];
       for (account acc : resultAcc) {
           if (acc.Active__c == 'Yes') {
                system.assert(acc.Description.contains('Active'));
           } else {
               system.assert(String.isBlank(acc.Description));
           }
       }
    }
}




