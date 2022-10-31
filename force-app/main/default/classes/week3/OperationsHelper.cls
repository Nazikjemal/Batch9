public with sharing class OperationsHelper {
  //Methods can be static

    //Assignment 2 Question 4.1 
    public decimal largestOutOfTwoNumbers(decimal a, decimal b){
        if(a > b){
            return a;
        }
        return b;
    }
    //Assignment 2 Question 4.2
    public decimal smallestOutOfThreeNumbers(decimal a, decimal b, decimal c){
        if(a <= b && a <= c){
            return a;
        }
        else if(b <= a && b <= c){
            return b;
        }
        return c;
    }
    //Assignment 2 Question 4.3
    public Integer sumofPositiveIntegers(Integer n){
        Integer sum;
        if(n<0){
            sum = null;
            system.debug('We are not calculating the sum for negative numbers');
        } else {
            sum = 0;
            for(Integer i = 1; i <= n; i++){
                sum += i;
            }
        }
        return sum;
    }

}


/*  Anonymous

    OperationsHelper o1 = new OperationsHelper();
    decimal o1largest = o1.largestOutOfTwoNumbers(50.5, 50.6);
    system.debug('o1largest = ' + o1largest);

    OperationsHelper o2 = new OperationsHelper();
    decimal o2smallest = o2.smallestOutOfThreeNumbers(50.5, 50.6,50.7);
    system.debug('o2smallest = ' + o2smallest);

    OperationsHelper o3 = new OperationsHelper();
    decimal o3sum = o3.sumofPositiveIntegers(10);
    system.debug('o3sum = ' + o3sum);
*/
