# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Area(models.Model):
    id = models.AutoField()
    code = models.CharField()

    class Meta:
        managed = False
        db_table = 'area'


class Customer(models.Model):
    id = models.AutoField()
    area = models.ForeignKey(Area, models.DO_NOTHING, blank=True, null=True)
    address = models.CharField()
    name = models.CharField()

    class Meta:
        managed = False
        db_table = 'customer'


class DeliveryPerson(models.Model):
    id = models.AutoField()
    restaurant = models.ForeignKey('Restaurant', models.DO_NOTHING, blank=True, null=True)
    name = models.CharField()
    area = models.ForeignKey(Area, models.DO_NOTHING, blank=True, null=True)
    availibility = models.TextField()  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'delivery_person'


class Dessert(models.Model):
    id = models.AutoField()
    product = models.ForeignKey('Product', models.DO_NOTHING, blank=True, null=True)
    name = models.CharField()

    class Meta:
        managed = False
        db_table = 'dessert'


class Drink(models.Model):
    id = models.AutoField()
    product = models.ForeignKey('Product', models.DO_NOTHING, blank=True, null=True)
    name = models.CharField()

    class Meta:
        managed = False
        db_table = 'drink'


class OrderToProduct(models.Model):
    order = models.ForeignKey('Orders', models.DO_NOTHING)
    product = models.ForeignKey('Product', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order_to_product'


class Orders(models.Model):
    id = models.AutoField()
    customer = models.ForeignKey(Customer, models.DO_NOTHING, blank=True, null=True)
    restaurant = models.ForeignKey('Restaurant', models.DO_NOTHING, blank=True, null=True)
    status = models.CharField()
    order_time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'orders'


class Pizza(models.Model):
    id = models.AutoField()
    product = models.ForeignKey('Product', models.DO_NOTHING, blank=True, null=True)
    name = models.CharField()

    class Meta:
        managed = False
        db_table = 'pizza'


class Product(models.Model):
    id = models.AutoField()
    price = models.TextField()  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'product'


class Restaurant(models.Model):
    id = models.AutoField()
    name = models.CharField()

    class Meta:
        managed = False
        db_table = 'restaurant'


class Toppings(models.Model):
    id = models.AutoField()
    vegetarian = models.TextField()  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'toppings'


class ToppingsToPizza(models.Model):
    pizza = models.ForeignKey(Pizza, models.DO_NOTHING)
    toppings = models.ForeignKey(Toppings, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'toppings_to_pizza'
