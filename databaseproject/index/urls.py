from django.urls import path

from . import views
from django.contrib import admin

urlpatterns = [
    path('', views.index, name="index"),
    path('sign-up/', views.sign_up, name="sign_up"),
    path('landing/', views.landing, name="landing"),
    path('confirm_product/', views.confirm_product, name="confirm_product"),
    path('confirm_order/', views.confirm_order, name='confirm_order'),
    path('clear_order/', views.clear_order, name='clear_order'),
    path('order_status/', views.order_status, name='order_status'),
    path('cancel_order/', views.cancel_order, name='cancel_order'),
]