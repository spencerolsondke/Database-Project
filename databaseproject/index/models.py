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

    def __str__(self):
        return self.code

class Product(models.Model):
    price = models.FloatField()

    class Meta:
        managed = True
        db_table = 'product'

    def __str__(self):
        return str(self.id) 


class Customer(models.Model):
    area = models.ForeignKey(Area, models.CASCADE, blank=True, null=True)
    address = models.CharField(max_length=45)
    name = models.CharField(max_length=45)
    username = models.CharField(max_length=45)
    password = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'customer'

    def __str__(self):
        return self.name


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

    def __str__(self):
        return self.name


class Dessert(models.Model):
    product = models.ForeignKey(Product, models.CASCADE, blank=True, null=True)
    name = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'dessert'

    def __str__(self):
        return self.name


class Drink(models.Model):
    product = models.ForeignKey(Product, models.CASCADE, blank=True, null=True)
    name = models.CharField(max_length=45)

    class Meta:
        managed = True
        db_table = 'drink'

    def __str__(self):
        return self.name


class Toppings(models.Model):
    name = models.CharField(max_length=45)
    vegetarian = models.IntegerField()
    price = models.FloatField()


    class Meta:
        managed = True
        db_table = 'toppings'

    def __str__(self):
        return self.name

class Pizza(models.Model):
    product = models.ForeignKey(Product, models.CASCADE, blank=True, null=True)
    name = models.CharField(max_length=45)
    toppings = models.ManyToManyField(Toppings)

    class Meta:
        managed = True
        db_table = 'pizza'

    def __str__(self):
        return self.name
