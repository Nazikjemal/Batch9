Map<String, Decimal> currISOCodeAndExchangeRateMap = new Map<String, Decimal>{
    'AUD' => 0.73,
    'CAD' => 0.78,
    'EUR' => 1.13,
    'NZD' => 0.68,
    'INR' => 0.0013
};

Boolean isContainsSAD = currISOCodeAndExchangeRateMap.containsKey('SAD');
System.debug(isContainsSAD);
