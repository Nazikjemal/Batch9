public with sharing class Calculator {

    public static decimal dynamicCalulationMethod(decimal num1, decimal num2, string operation){

        decimal result = 0;

        switch on operation {
            when 'ADDITION' {
                result = num1 + num2;
            }
            when 'SUBTRACTION' {
                result = num1 - num2;
            }
            when 'DIVISION' {
                result = num1 / num2;
            }
            when 'MULTIPLICATION' {
                result = num1 * num2;
            }
            when else {
                system.debug('Undefined Operation. Please check your parameters');
                result = null;
            }
        }
        return result;
    }

}

/* Anonymous
    Decimal dAdd = Calculator.dynamicCalulationMethod(55.5, 60, 'ADDITION');
    System.debug('dAdd = ' + dAdd);
    Decimal dSUB = Calculator.dynamicCalulationMethod(55.5, 60, 'SUBTRACTION');
    System.debug('dSub = ' + dSub);
    Decimal dDiv = Calculator.dynamicCalulationMethod(55.5, 60, 'DIVISION');
    System.debug('div = ' + dDiv);
    Decimal dMul = Calculator.dynamicCalulationMethod(55.5, 60, 'MULTIPLICATION');
    System.debug('mul = ' + dMul);
    Decimal dMul2 = Calculator.dynamicCalulationMethod(55.5, 60, 'mulipouiasdf');
    System.debug('mul2 = ' + dMul2);
 */