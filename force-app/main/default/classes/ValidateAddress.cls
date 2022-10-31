public with sharing class ValidateAddress {
    
    public void validateHomeAddress(){

        String houseName = 'My New Home';
        String street = 'The Independent St. NY';
        String city = 'New Jersey';
        String state = 'New York';
        String stateISOCode = 'NY';
        String country = 'United State';
        String countryISOCode = 'US';
   
        //1. The number of characters in the street name
        Integer streetNameLength = street.length();
        System.debug('Number of Characters in Street name   '+streetNameLength);

        //2. Check if the street name contains a house name in it or not
        Boolean streetContainsHouseName = street.contains(houseName);
        System.debug('Street Name Contains house name or not    '+streetContainsHouseName);

        //3. Find if the street name contains the state iso code in it
        Boolean streetContainsStateISO = street.contains(stateISOCode);
        System.debug('Street Name Contains state ISO code or not    '+streetContainsStateISO);

        //4. Convert the state iso code, country iso code, country name to uppercase and city name, and state name to lowercase
        String stateISOUpper = stateISOCode.toUpperCase();
        System.debug('State ISO in Upper case    '+stateISOUpper);

        String countryISOUpper = countryISOCode.toUpperCase();
        System.debug('Country ISO in Upper case    '+countryISOUpper);

        String countryUpper = country.toUpperCase();
        System.debug('Country Name in Upper case    '+countryUpper);

        String cityLower = city.toLowerCase();
        System.debug('City Name in lower case    '+cityLower);

        String stateLower = state.toLowerCase();
        System.debug('State Name in lower case    '+stateLower);

        //5. Concatenate the house name, street name, City Name, State Name, and Country Name and store it in a variable
        String concatHouseAndStreet = houseName + ' ' + street + ' ' + city;

    }

}
