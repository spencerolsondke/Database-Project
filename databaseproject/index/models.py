# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = True` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Area(models.Model):
    code = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'area'


class Product(models.Model):
    price = models.FloatField()

    class Meta:
        managed = True
        db_table = 'product'


class Customer(models.Model):
    area = models.ForeignKey(Area, models.CASCADE, blank=True, null=True)
    address = models.CharField(max_length=45)
    name = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'customer'


class Orders(models.Model):
    customer = models.ForeignKey(Customer, models.CASCADE, blank=True, null=True)
    status = models.CharField(max_length=45)
    order_time = models.DateTimeField()
    products = models.ManyToManyField(Product)

    class Meta:
        managed = True
        db_table = 'orders'


class DeliveryPerson(models.Model):
    name = models.CharField(max_length=45)
    area = models.ForeignKey(Area, models.CASCADE, blank=True, null=True)
    availibility = models.IntegerField()

    class Meta:
        managed = True
        db_table = 'delivery_person'


class Dessert(models.Model):
    product = models.ForeignKey(Product, models.CASCADE, blank=True, null=True)
    name = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'dessert'


class Drink(models.Model):
    product = models.ForeignKey(Product, models.CASCADE, blank=True, null=True)
    name = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'drink'


class Toppings(models.Model):
    name = models.CharField(max_length=45)
    vegetarian = models.IntegerField()
    price = models.FloatField()


    class Meta:
        managed = True
        db_table = 'toppings'

class Pizza(models.Model):
    product = models.ForeignKey(Product, models.CASCADE, blank=True, null=True)
    name = models.CharField(max_length=45)
    toppings = models.ManyToManyField(Toppings)

    class Meta:
        managed = True
        db_table = 'pizza'
