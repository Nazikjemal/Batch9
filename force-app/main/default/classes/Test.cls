@isTest
public class Test {

    @TestSetup
    static void makeData(){
        Account acc = new Account();
        acc.Name = 'Test';
        insertAccount();
    }

    @isTest static void insertAccount(){
      
        //Test insert scenario
    }

    @isTest static void updateAccount(){
        
        //Test update scenario
    }

    @isTest static void deleteAccount(){
     
        //Test delete scenario
    }

}
