from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponse
from index.models import Pizza
from index.models import Area
from index.models import Customer
from index.forms import Register_Form
from index.forms import Login_Form

# Create your views here
def index(request):
    context = { "pizzalist": Pizza.objects.all()}
    return render(request, 'login.html', context) 

def sign_up(request):
    if request.method == "POST":
        form = Register_Form(request.POST)
        if form.is_valid():
            # Add the customer to the database
            area = Area.objects.filter(code=form.data.get('area_code')).get() # Access the area object to add it as a foreign key
            customer = Customer.objects.create(area=area, address=form.data.get('address'), name=form.data.get('name'), 
                    username=form.data.get('username'), password=form.data.get('confirm_password'))
            customer.save()

            return HttpResponse("Customer added to the database")

    else:
        form = Register_Form()  

    context = { "form": form }
    return render(request, 'sign-up.html', context) 
