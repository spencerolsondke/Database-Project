from django.urls import path

from . import views
from django.contrib import admin

urlpatterns = [
    path('', views.index, name="index"),
    path('sign-up/', views.sign_up, name="sign_up"),
    path('landing/', views.landing, name="landing"),
    path('confirm_product/', views.confirm_product, name="confirm_product")
]