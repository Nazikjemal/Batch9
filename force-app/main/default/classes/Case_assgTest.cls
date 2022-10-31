@isTest
public with sharing class Case_assgTest {
   
    @isTest static void deleteCase(){
        Case c = new Case();
        c.Subject = 'Test case 1%'; 
        c.Origin='Phone'; 
        insert c; 

        Test.startTest();
        Case_assg.caseDelete();
        Test.stopTest();

        List<Case> c2 = [SELECT id, Subject, Origin FROM Case  WHERE Subject LIKE '%case 1%'];
        System.assertEquals(0, c2.size());

    }  
}
