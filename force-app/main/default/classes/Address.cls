public with sharing class Address {
    
    public void homeAddress(){
        String name = 'Jane';
        Integer noOfMembers = 16;
        String houseName = 'Apartment';
        String houseNumber = '16A';
        String streetName = 'Doncaster Rd';
        String cityName = 'London';
        String stateName = 'London';
        String stateISO = 'LN';
        String countryName = 'England';
        String countryISO = 'EN';
        String zipCode = 'L49 BT9';
        Boolean isCurrentHome = true;

        System.debug(name);
        System.debug(noOfMembers);
        System.debug(houseName);
        System.debug(houseNumber);
        System.debug(streetName);
        System.debug(cityName);
        System.debug(stateName);
        System.debug(stateISO);
        System.debug(countryName);
        System.debug(countryISO);
        System.debug(zipCode);
        System.debug(isCurrentHome);

    }

}
