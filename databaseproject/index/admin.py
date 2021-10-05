from django.contrib import admin
import index.models

admin.site.register(index.models.Pizza)
admin.site.register(index.models.Toppings)
admin.site.register(index.models.Area)
admin.site.register(index.models.Customer)
admin.site.register(index.models.DeliveryPerson)
admin.site.register(index.models.Dessert)
admin.site.register(index.models.Drink)
admin.site.register(index.models.Orders)
admin.site.register(index.models.Product)