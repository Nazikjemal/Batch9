
@isTest
public class Contact_assgTest {
    @TestSetup
    static void makeData(){
        //Since we are going to test scenarios for insert, update, and delete, we'll create records that matches for them all. 
        //It's always good to check how our code works for bulk records.
        //So we can create total 100 records. 50 Contact records with department name 'Soft Innovas' (which we need for update) and rest with 'SI Salesforce'
   
        List<Contact> conList = new List<Contact>();
        for (Integer i = 1; i <= 100; i++) {
            Contact con = new Contact();
            con.LastName = 'Doe ' + i;
            if(i<=50){
                con.Department = 'Soft Innovas';
            }
            else{
                con.Department = 'SI Salesforce';
            }
            conList.add(con);
        }
        insert conList;
    }
    @isTest static void insertContacts(){

        List<Contact> conListBeforeInsert = [SELECT id FROM Contact];
        System.assertEquals(100, conListBeforeInsert.size());

        Test.startTest();
        Contact_assg.contactInsert();
        Test.stopTest();

        List<Contact> conList = [SELECT id, Department FROM Contact where Department= 'Soft Innovas'];
        //We already inserted 50 records with Department= 'Soft Innovas'. After calling method it should give us 50+5 for size
        System.assertEquals(55, conList.size());
        for (Contact con : conList) {
            System.assertEquals('Soft Innovas', con.Department);
        }
    }
    @isTest static void updateContacts(){
        Test.startTest();
        Contact_assg.contactUpdate();
        Test.stopTest();

        List<Contact> conList = [SELECT id, LastName, Department FROM Contact where Department= 'SI Salesforce'];
        //contactUpdate() method updates records which are Department= 'Soft Innovas' to be Department = 'SI Salesforce'
        //We already have 50 records with Department = 'SI Salesforce' so it will give 100 for size
        System.assertEquals(100, conList.size());
        for (Contact con : conList) {
            System.assertEquals('SI Salesforce', con.Department);
        }
    }
    @isTest static void deleteContacts(){

        Test.startTest();
        Contact_assg.contactDelete();
        Test.stopTest();

        List<Contact> conList = [SELECT id, LastName, IsDeleted, Department FROM Contact where Department= 'SI Salesforce'];

        System.assertEquals(0, conList.size());
        for (Contact con : conList) {
            System.assertEquals(true, con.IsDeleted);
        }
    }
}
