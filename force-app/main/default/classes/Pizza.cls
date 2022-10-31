public with sharing class Pizza {
    
    public String topping;
    public String size;
    public Integer pizzaCount;

    public Pizza(String topping, String size, Integer pizzaCount) {
        this.topping = topping;
        this.size = size;
        this.pizzaCount = pizzaCount;
    }

    public void getPizzaOrder(){
        System.debug('Pizza topping: ' + topping);
        System.debug('Pizza size: ' + size);
        System.debug('Number of pizzas: ' + pizzaCount);

    }
}
