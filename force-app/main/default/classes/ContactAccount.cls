public class ContactAccount {
  

        // Week 6 EXTRA - Question 1.4
        // When a new contact is created for an existing account then set contact other phone as account phone

    public static void newContactonExistingAccount(List<Contact> conTriggerNew){

        Set<Id> accId = new Set<Id>();

        for(Contact eachCon : conTriggerNew) {
            if(eachCon.AccountId != null){
                accId.add(eachCon.AccountId);
            }
        }

        if(!accId.isEmpty()){
            //Option 1
            List<Account> accList = [SELECT id, phone FROM Account WHERE id IN : accId];
            Map<Id,Account> accMap = new Map<Id,Account>();

            for(Account eachAcc : accList){
                accMap.put(eachAcc.id, eachAcc);
            }

            for(Contact eachCon : conTriggerNew){
                if(accMap.get(eachCon.AccountID).Phone != null){
                    eachCon.OtherPhone = accMap.get(eachCon.AccountID).Phone;
                }
            }

            //Option 2
            // Map<Id,Account> accMap2 = new Map<id, Account>([SELECT id, phone FROM Account WHERE id IN : accId]);

            // for(Contact eachCon : conTriggerNew){
            //     if(accMap2.get(eachCon.AccountID).Phone != null){
            //         eachCon.OtherPhone = accMap2.get(eachCon.AccountID).Phone;
            //     }
            // }


        }

    }

}
