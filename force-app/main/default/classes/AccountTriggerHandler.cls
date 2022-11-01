public class AccountTriggerHandler {
  public static void updateDescription(List<account> accTriggerNew, 
                                      List<account> accTriggerOld,
                                      Map<id, account> accTriggerNewMap,
                                      Map<id, account> accTriggerOldMap) {

      for (account eachAcc : accTriggerNew) {
          boolean updateDesc = false;
          //trigger.isInsert && eachAcc.active__c == 'yes'
          //Trigger.oldMap == null 
          if (accTriggerOldMap == null && eachAcc.Active__c == 'Yes') {
              updateDesc = true;
          }
          if (accTriggerOldMap != null) {
              if (eachAcc.Active__c == 'Yes' 
              && accTriggerOldMap.get(eachAcc.Id).Active__c != accTriggerNewMap.get(eachAcc.Id).Active__c) {
                  updateDesc = true;
              }
          }
          if (updateDesc) {
              eachAcc.Description = 'Account is now Active. ENJOY!';
          }
      }
  }

}


//Here we are testing git branching