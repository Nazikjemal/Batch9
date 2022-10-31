Cat sf = new Cat();
sf.name = 'dummy';
sf.color = 'white';
System.debug(sf);

Cat sf2 = new Cat('fluffy', 'white', 2);
System.debug(sf2);

Pizza p = new Pizza('Double cheese', 'Medium', 3);
p.getPizzaOrder();
