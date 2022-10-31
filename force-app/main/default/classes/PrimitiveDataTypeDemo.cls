public with sharing class PrimitiveDataTypeDemo {
 
    public void printBasicDataTypes(){
        System.debug('Printing primitive datatypes');

        String batchName = 'Batch9';
        Integer totalCandidates = 70;
        Boolean isAdminCompleted = true;

        System.debug(batchName);
        System.debug(totalCandidates);
        System.debug(isAdminCompleted);

        String batchDescription = batchName + ' is the best';
        System.debug(batchDescription);
    }
}
