trigger OpportunityTrigger on Opportunity(
  after update, //.new .old .newMap .oldMap
  after insert, //.new .newMap
  after delete, //.old .oldMap
  after undelete //.new .newMap
) {

  Set<Id> accIds = new Set<Id>();

    if(trigger.isAfter){

      if(Trigger.isInsert || Trigger.isUndelete){
        for(Opportunity opp : Trigger.new){
          if(opp.AccountId != null){
            accIds.add(opp.AccountId);
          }
        }
      }

      if(Trigger.isUpdate){
        for (Opportunity newOpp : Trigger.new) {
              Opportunity oldOpp = Trigger.oldMap.get(newOpp.Id);

            if(newOpp.Amount != oldOpp.Amount || newOpp.AccountId != oldOpp.AccountId || newOpp.StageName != oldOpp.StageName){
              accIds.add(newOpp.AccountId);
              accIds.add(oldOpp.AccountId);
            }
        }
      }

      if(Trigger.isDelete){
        for (Opportunity opp : Trigger.old) {
          if(opp.AccountId != null){
            accIds.add(opp.AccountId);
          }
        }
      }

    }

    if(!accIds.isEmpty()){
      OpportunityTriggerHandler.updateHighestAmountOpportunityName(accIds);
      OpportunityTriggerHandler.updateTargetAmountAchievedOpportunityName(accIds);
      OpportunityTriggerHandler.updateTotalAmountGenerated(accIds);
    }
  
}
