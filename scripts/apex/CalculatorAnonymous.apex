Calculator c = new Calculator();
Date today = Date.today();
Boolean isLeap = c.leapYearCheck(today);
System.debug('this year is leap? ' + isLeap);