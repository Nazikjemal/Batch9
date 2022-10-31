public class Contact_assg {
  public static void contactInsert() {
    
    List<Contact> conList = new List<Contact>();
    
    for (Integer i = 1; i < 6; i++) {
      Contact con = new Contact();
      con.LastName = 'Doe ' + i;
      con.Department = 'Soft Innovas';
      conList.add(con);
    }

    insert conList;

  }

  public static void contactUpdate() {

    List<Contact> conList = [SELECT Id, Department FROM Contact WHERE Department = 'Soft Innovas'];

    for (Contact eachCon : conList) {
      eachCon.Department = 'SI Salesforce';
    }

    update conList;

  }

  public static void contactDelete() {

    List<Contact> conList = [SELECT Id, Department FROM Contact WHERE Department = 'SI Salesforce'];
    
    delete conList;
  }
}
