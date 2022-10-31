public with sharing class Student {
    public string firstName;
    public string lastName;
    public integer year;
    public string major;

   public string generateReport(){
       system.debug('Report generated for ' + firstName + 
                    ' ' + lastName + ' for ' + year);
       return major;
   }
}

/*  Anonymous

    Students srk = new Students();
    srk.firstName = 'Shah-Ruk';
    srk.lastName = 'Khan';
    srk.year = 1980;
    srk.major = 'Arts';
    string returnMajor = srk.generateReport();
    system.debug('returned major is ' + returnMajor);

    Students ssr = new Students();
    ssr.firstName = 'Shushant Singh';
    ssr.lastName = 'Rajput';
    ssr.year = 2007;
    ssr.major = 'Arts';
    string returnMajorSsr = ssr.generateReport();
    system.debug('returned major is ' + returnMajorSsr); 
*/