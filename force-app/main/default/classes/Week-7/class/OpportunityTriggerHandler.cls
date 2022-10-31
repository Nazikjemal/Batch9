public with sharing class OpportunityTriggerHandler {
 
    @future
    public static void updateHighestAmountOpportunityName(Set<Id> accIds){
        List<Account> accListWithOpps = [Select Highest_Amount_Opportunity_Name__c, 
        (SELECT Name, Amount FROM Opportunities WHERE Amount != null ORDER BY Amount DESC) FROM Account WHERE id IN : accIds];

        for (Account acc : accListWithOpps) {
            if(acc.Opportunities.size() > 0){
                acc.Highest_Amount_Opportunity_Name__c = acc.Opportunities[0].Name;
            } else {
                acc.Highest_Amount_Opportunity_Name__c = null;
            }
        }

        update accListWithOpps;
    }

    @future
    public static void updateTargetAmountAchievedOpportunityName(Set<Id> accIds){
        List<Account> accListWithOpps = [Select Target_Amount_Achieved_Opportunity_Name__c, Target_Amount__c, 
        (SELECT Name, Amount FROM Opportunities WHERE Amount != null AND StageName = 'Closed Won' ORDER BY Amount DESC) FROM Account WHERE id IN : accIds];

        for (Account acc : accListWithOpps) {
            if(acc.Opportunities.size() > 0 && acc.Opportunities[0].Amount >= acc.Target_Amount__c){
                acc.Target_Amount_Achieved_Opportunity_Name__c = acc.Opportunities[0].Name;
            } else {
                acc.Target_Amount_Achieved_Opportunity_Name__c = null;
            }
        }

        update accListWithOpps;
    }


    @future
    public static void updateTotalAmountGenerated(Set<Id> accIds) {
        List<Account> accListWithOpps = [SELECT Total_Amount_Generated__c,
        (SELECT Amount FROM Opportunities WHERE StageName = 'Closed Won' AND Amount != NULL) FROM Account WHERE Id IN :accIds];

        for (Account acc : accListWithOpps) {
            Double totalAmount = 0; 

            for (Opportunity opp : acc.Opportunities) {
                totalAmount = totalAmount + opp.Amount;
            }

            acc.Total_Amount_Generated__c = totalAmount;
        }

        update accListWithOpps;
    } 

}
