import index.models as model

toppings = {
    ('Mozzarella', 2.99, True),
    ('Tomato Sauce', 1.99, True),
    ('Mushrooms', 3.49, True),
    ('Prosciutto', 3.99, False),
    ('Cherry Tomatoes', 2.99, True),
    ('Basilicum', 0.99, True), 
    ('Salami', 3.49, False), 
    ('Pork Rinds', 3.99, False), 
    ('Spicy Salami', 3.49, False), 
    ('Pepperoncini', 1.99, True), 
    ('Olives', 0.99, True), 
    ('Eggplant', 1.99, True), 
    ('Pineapple', 1.99, True), 
    ('Ham', 3.49, False), 
    ('Shrimp', 4.99, False), 
    ('Squid', 4.99, False), 
    ('Mussels', 5.49, False), 
    ('Tuna', 3.49, False), 
    ('Pesto Genovese', 1.99, True),
    ('Artichoke', 2.99, True), 
    ('Fontina', 2.99, True), 
    ('Grana Padano', 1.99, True),
    ('Gorgonzola', 3.99, True), 
    ('Ricotta', 1.99, True)
}

pizzas = [
   ('Prosciutto e funghi', "Mozzarella"),
   ('Detroit-Style',),
   ('Capricciosa',),
   ('Quattro fromaggi',),
   ('Caprese',),
   ('Calzone',),
   ('Margherita',),
   ('Napoletana',),
   ('Diavola',),
   ('Melanzane',),
   ('Hawaii',),
   ('Frutti di Mare',),
   ('Tonno',),
   ('Prosciutto',),
   ('Al Pesto',),
]

for t in toppings:
    if(len(model.Toppings.objects.filter(name=t[0]))==0):
        temp = model.Toppings(name=t[0], price=t[1], vegetarian=t[2])
        temp.save()


for p in pizzas:
    if(len(model.Pizza.objects.filter(name=p[0]))==0):
        temp = model.Pizza(name=p[0])
        temp.save()
        if(type(p) == 'tuple'):
            for t in p[1:]:
                temp.toppings.add(t)
        