public class CaseTriggerHandler {
  public static void insertCase(){
    Case c = new Case();
    c.Subject = 'Case Tigger Test';
    c.Status = 'New';
    c.Origin = 'Web';

    insert c;
  }
  public static void updateCase(){
    Case c = [SELECt id, subject FROM Case ORDER BY CreatedDate DESC LIMIT 1];
    c.Subject += ' Update';
    update c;
  }
  public static void deleteCase(){
    Case c = [SELECt id, subject FROM Case ORDER BY CreatedDate DESC LIMIT 1];
    delete c;
  }
}
