from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponse
from index.models import Pizza
from index.forms import User_Form

# Create your views here
def index(request):
    context = { "pizzalist": Pizza.objects.all()}
    return render(request, 'login.html', context) 

def sign_up(request):
    if request.method == "POST":
        form = User_Form(request.POST)
        if form.is_valid():
            

            return HttpResponse("All good")

    else:
        form = User_Form()  

    context = { "form": form }
    return render(request, 'sign-up.html', context) 
