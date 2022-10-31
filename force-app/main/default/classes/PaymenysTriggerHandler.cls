public class PaymenysTriggerHandler {
   
    public static void insertPayments(List<Payments__c> triggerNew){
        Set<Id> customerId = new Set<Id>();
        for (Payments__c eachPay : triggerNew) {
            customerId.add(eachPay.Customer__c);
        }

        if(!customerId.isEmpty()){
            List<Customer__c> customerList = [SELECT Total_Amount__c, (SELECT id, Amount__c FROM Payments__r) FROM Customer__c WHERE Id IN : customerId];
            List<Customer__c> updateCustomerList = new  List<Customer__c>();

            for (Customer__c eachCus : customerList) {
                Decimal totalAmount = 0;
                for(Payments__c eachPay : eachCus.Payments__r){
                    totalAmount += eachPay.Amount__c;
                }
                eachCus.Total_Amount__c = totalAmount;
                updateCustomerList.add(eachCus);
            }

            update updateCustomerList;

        }
    }

    public static void updatePayments(List<Payments__c> triggerNew, Map<Id, Payments__c> TriggerOldMap){
        Set<Id> customerId = new Set<Id>();
        for(Payments__c eachPay : triggerNew){
            Payments__c oldPay = TriggerOldMap.get(eachPay.id);

            if(eachPay.Customer__c != oldPay.Customer__c  || eachPay.Amount__c != oldPay.Amount__c){
                customerId.add(eachPay.Customer__c);
                customerId.add(oldPay.Customer__c);
            }
        }

        if(!customerId.isEmpty()){
            List<Customer__c> customerList = [SELECT Total_Amount__c, (SELECT id, Amount__c FROM Payments__r) FROM Customer__c WHERE Id IN : customerId];
            List<Customer__c> updateCustomerList = new  List<Customer__c>();

            for (Customer__c eachCus : customerList) {
                Decimal totalAmount = 0;
                for(Payments__c eachPay : eachCus.Payments__r){
                    totalAmount += eachPay.Amount__c;
                }
                eachCus.Total_Amount__c = totalAmount;
                updateCustomerList.add(eachCus);
            }

            update updateCustomerList;
        }

    }

    public static void deletePayments(List<Payments__c> triggerOld){
        Set<Id> customerId = new Set<Id>();
        for (Payments__c eachPay : triggerOld) {
            customerId.add(eachPay.Customer__c);
        }

        if(!customerId.isEmpty()){
            List<Customer__c> customerList = [SELECT Total_Amount__c, (SELECT id, Amount__c FROM Payments__r) FROM Customer__c WHERE Id IN : customerId];
            List<Customer__c> updateCustomerList = new  List<Customer__c>();

            for (Customer__c eachCus : customerList) {
                Decimal totalAmount = 0;
                for(Payments__c eachPay : eachCus.Payments__r){
                    totalAmount += eachPay.Amount__c;
                }
                eachCus.Total_Amount__c = totalAmount;
                updateCustomerList.add(eachCus);
            }

            update updateCustomerList;

        }
    }

}
