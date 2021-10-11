from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponse
from index.models import Pizza, Area, Drink, Dessert, Customer, Orders, Product, Product_To_Orders
from index.forms import Confirm_Product_Form, Register_Form
from index.forms import Login_Form
from index.utils import compute_pizza_prices as cpp, get_Product
from index.utils import compute_drink_dessert_prices as cddp
from index.utils import is_pizza_vegetarian as ipv
from index.utils import get_pizza_toppings as gpt
from index.utils import Order_Badge, current_badge
import index.apps as apps
from datetime import datetime

# Create your views here
def index(request):
    if request.method == "POST":
        form = Login_Form(request.POST)
        if form.is_valid():
            # The session variable has always 'test' in the list, even if we restart the server
            request.session['product_list'] = []
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

    order_list = [get_Product(p).name for p in request.session['product_list']]
    context = {
        "first_name": first_name,
        "pizza_list": zip(pizzas, pizza_veg, pizza_toppings, pizza_prices, pizza_ids),
        "drink_list": zip(drinks, drink_prices, drink_ids),
        "dessert_list": zip(desserts, dessert_prices, dessert_ids),
        "order_list": order_list
    }
    return render(request, 'landing.html', context)


def sign_up(request):
    if request.method == "POST":
        form = Register_Form(request.POST)
        if form.is_valid():
            # Add the customer to the database
            area = Area.objects.get(id=form.data.get('area_code')) # Access the area object to add it as a foreign key
            customer = Customer.objects.create(area=area, address=form.data.get('address'), name=form.data.get('name'), 
                    phone=form.data.get('phone'), username=form.data.get('username'), password=form.data.get('confirm_password'))
            customer.save()

            return HttpResponseRedirect("/")

    else:
        form = Register_Form()  

    context = { "form": form }
    return render(request, 'sign-up.html', context) 


def confirm_order(request):
    if request.method == "GET":
        # Add the order to the database
        products = request.session["product_list"]
        customer = Customer.objects.filter(id=request.session['user_id']).get()
        order = Orders.objects.create(customer=customer, status="In process", 
                order_time=datetime.utcnow(), order_delivery_time="1990-01-01 00:00")
        
        order.save()

        for i in products:
            products_to_order = Produc
        
        # TODO Reset the session variable that stores the product list
    
        # Add the order to the badge
        current_badge[Area.objects.get(customer.area).get('id')].append_order(order)
    
        context = { 
            "product_list": request.session["product_list"],
            "user_id": request.session["user_id"] 
        }
    
    else:
        context = {}

    # TODO Render a frame that thanks the user for the order
    return render(request, "order_confirmed.html", context)


def confirm_product(request):
    product_list = request.session['product_list']
    
    if request.method == "POST":
        form = Confirm_Product_Form(request.POST)
        # for i in range(int(form.data.get('amount'))) :
        product_list = product_list+[{ 'product_id': form.data.get('id'), 'amount': int(form.data.get('amount'))}]
        request.session['product_list'] = product_list
        print(request.session['product_list'])
        return HttpResponseRedirect('/landing/')

    if request.method == "GET":
        form = Confirm_Product_Form({'id': request.GET['product_id']})

    context = { 
        "product_id": request.GET.get('product_id'),
        "form": form
    }
    return render(request, 'confirm_product.html', context)
