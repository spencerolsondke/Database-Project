from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponse
from index.models import Pizza, Area, Drink, Dessert, Customer
from index.forms import Confirm_Product_Form, Register_Form
from index.forms import Login_Form
from index.utils import compute_pizza_prices as cpp
from index.utils import compute_drink_dessert_prices as cddp
from index.utils import is_pizza_vegetarian as ipv
from index.utils import get_pizza_toppings as gpt
import index.apps as apps

# Create your views here
def index(request):
    if request.method == "POST":
        form = Login_Form(request.POST)
        if form.is_valid():
            request.session['user_id'] = Customer.objects.get(username=form.data.get('username')).id
            return HttpResponseRedirect("/landing/")
    else:
        form = Login_Form()
    context = { 
        "pizzalist": Pizza.objects.all(),
        "form": form,
    }
    return render(request, 'login.html', context) 


def landing(request):
    first_name = Customer.objects.get(id=request.session['user_id']).name.split(' ')[0]

    pizzas = Pizza.objects.all()
    pizza_prices = ["{:,.2f}€".format(i) for i in cpp()]
    pizza_veg = ipv()
    pizza_toppings = [[topping.name for topping in pizza] for pizza in gpt()]
    pizza_ids = [pizza.product for pizza in pizzas]

    drinks = Drink.objects.all()
    drink_prices = ["{:,.2f}€".format(i) for i in cddp(Drink)]
    drink_ids = [drink.product for drink in drinks]

    desserts = Dessert.objects.all()
    dessert_prices = ["{:,.2f}€".format(i) for i in cddp(Dessert)]
    dessert_ids = [dessert.product for dessert in desserts]

    context = {
        "first_name": first_name,
        "pizza_list": zip(pizzas, pizza_veg, pizza_toppings, pizza_prices, pizza_ids),
        "drink_list": zip(drinks, drink_prices, drink_ids),
        "dessert_list": zip(desserts, dessert_prices, dessert_ids),
    }
    return render(request, 'landing.html', context)


def sign_up(request):
    if request.method == "POST":
        form = Register_Form(request.POST)
        if form.is_valid():
            # Add the customer to the database
            area = Area.objects.get(id=form.data.get('area_code')) # Access the area object to add it as a foreign key
            customer = Customer.objects.create(area=area, address=form.data.get('address'), name=form.data.get('name'), 
                    username=form.data.get('username'), password=form.data.get('confirm_password'))
            customer.save()

            return HttpResponseRedirect("/")

    else:
        form = Register_Form()  

    context = { "form": form }
    return render(request, 'sign-up.html', context) 


def confirm_order(request):
    context = { "product_list": request.session["product_list"]}
    # Add to the badge
    apps.badges.append('test')
    pass


def confirm_product(request):
    # The session variable has always 'test' in the list, even if we restart the server
    if 'product_list' not in request.session:
        request.session['product_list'] = []
    product_list = request.session['product_list']
    
    if request.method == "POST":
        form = Confirm_Product_Form(request.POST)
        product_list = product_list+[form.data.get('id')]
        request.session['product_list'] = product_list

    else:
        form = Confirm_Product_Form(initial={'id': request.GET['product_id']}) # Error with product_id

    print(request.session['product_list'])

    context = { 
        "product_id": request.GET['product_id'],
        "form": form
    }
    return render(request, 'confirm_product.html', context)
