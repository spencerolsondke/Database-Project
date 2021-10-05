from django.contrib import admin
import index.models

admin.site.register(index.models.Pizza)
admin.site.register(index.models.Toppings)