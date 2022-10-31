//Create a set named fruitsSet and store 4 fruits
Set<String> fruitsSet = new Set<String>{'Mango', 'Banana', 'Grapes', 'Organge'};

// Print Fruits name from fruitsSet one by one
for(String fruit: fruitsSet){
    System.debug('fruit name : '+fruit);
}

//Print the size of the fruitsSet.
Integer fruitCount = fruitsSet.size();
System.debug('Number Fruits : '+fruitCount);

//Add a fruit name "Apricot" to the fruitsSet.
fruitsSet.add('Apricot');
System.debug('Number Fruits : '+fruitsSet);

//Check if the fruitsSet contains the fruit 'Apricot'
Boolean isApricotPresent = fruitsSet.contains('Apricot');
System.debug('Is Apricot Present : '+isApricotPresent);

//Check if the fruitsSet is empty?
Boolean isFruitsSetEmpty = fruitsSet.isEmpty();
System.debug('Is fruitSet Empty : '+isFruitsSetEmpty);
