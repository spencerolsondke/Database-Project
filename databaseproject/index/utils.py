from index.models import Pizza, Drink, Dessert, Orders, DeliveryPerson, Area
from index import models
from datetime import datetime

def get_Product(product_id):
    pizza = Pizza.objects.filter(product=product_id)
    drink = Drink.objects.filter(product=product_id)
    dessert = Dessert.objects.filter(product=product_id)

    if pizza.exists():
        return pizza.first()
    elif drink.exists():
        return drink.first()
    elif dessert.exists():
        return dessert.first()


class Order_Badge():
    badge = None
    area = None
    delivery_person = None
    time = None
    delivery_start_time = None
    status = 'In process'

    def __init__(self, area:Area, time:datetime):
        self.badge = []
        self.area = area
        self.time = time
    
    def get_badge(self) -> list:
        return self.badge

    def set_area(self, area:Area) -> None:
        self.area = area

    def get_area(self) -> Area:
        return self.area

    def get_delivery_person(self) -> DeliveryPerson:
        return self.delivery_person

    def get_time(self) -> datetime:
        return self.time

    def set_delivery_person(self, dp: DeliveryPerson):
        self.delivery_person = dp
        # for order in badge:
        #     order.delivery_person = dp
        #     order.save()
    
    def append_order(self, order: Orders):
        self.badge.append(order)

    def set_status(self, status:str) -> None:
        self.status = status
        for order in self.badge:
            order.status = status
            order.save()
    
    def get_status(self) -> str:
        return self.status

    def set_delivery_start_time(self, time: datetime) -> None:
        self.delivery_start_time = time
        for order in self.badge:
            order.order_delivery_time = time
            order.save()

    def get_delivery_start_time(self) -> None:
        return self.delivery_start_time
    
    def set_delivery_person_available(self) -> None:
        self.delivery_person.availibility = True
        self.delivery_person.save()

current_time = datetime.now()
current_badge = [Order_Badge(i, current_time) for i in Area.objects.all()]
# current_badge[0].append_order(Orders.objects.first())

def compute_pizza_prices() -> list:
    prices = []
    pizzas = Pizza.objects.all()
    for pizza in pizzas:
        pizza_prices = round(sum([i.price for i in pizza.toppings.all()]), 2)
        pizza_prices = round(pizza_prices + pizza_prices*0.4, 2) # 40% margin for the pizza
        pizza_prices = round(pizza_prices + pizza_prices*0.09, 2) # 9% VAT
        prices.append((pizza.product_id, pizza_prices))

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


def _get_current_badge() -> list:
    return current_badge

def _add_order_to_current_badge(index: int, order: Orders):
    current_badge[0].append_order(order)

def _reset_current_badge() -> None:
    current_time = datetime.now()
    current_badge = [Order_Badge(i, current_time) for i in Area.objects.all()]

