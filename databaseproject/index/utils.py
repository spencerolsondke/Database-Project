from index.models import Pizza, Drink, Dessert
from index import models

def compute_pizza_prices() -> list:
    prices = []
    pizzas = Pizza.objects.all()
    for pizza in pizzas:
        pizza_prices = round(sum([i.price for i in pizza.toppings.all()]), 2)
        pizza_prices = round(pizza_prices + pizza_prices*0.4, 2) # 40% margin for the pizza
        pizza_prices = round(pizza_prices + pizza_prices*0.09, 2) # 9% VAT
        prices.append(pizza_prices)

    return prices


def is_pizza_vegetarian() -> list:
    veg = []
    pizzas = Pizza.objects.all()
    is_false = False
    for pizza in pizzas:
        veg.append(not pizza.toppings.filter(vegetarian=False).exists())
    

    return veg

def get_pizza_toppings() -> list:
    pizza_toppings = []
    pizzas = Pizza.objects.all()
    for pizza in pizzas:
        pizza_toppings.append(pizza.toppings.all())
    
    return pizza_toppings


def compute_drink_dessert_prices(entity:models) -> list:
    return [i.product.price for i in entity.objects.all()]
