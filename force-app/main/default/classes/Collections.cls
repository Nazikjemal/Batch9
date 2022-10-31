public with sharing class Collections {
 
    public static String listAssignment(Integer input){

        List<String> monthList = new List<String>();
        monthList.add('January');
        monthList.add('February');
        monthList.add('March');
        monthList.add('April');
        monthList.add('May');
        monthList.add('June');
        monthList.add('July');
        monthList.add('August');
        monthList.add('September');
        monthList.add('October');
        monthList.add('November');
        monthList.add('December');

        String output_month = 'Not a valid month';

        if(input<=monthList.size() && input>0 ){
            input = input - 1;
            output_month = monthList.get(input);
        } 

        return output_month;
        
    }
}

//Collections.listAssignment(3)