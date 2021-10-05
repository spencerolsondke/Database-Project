from django.shortcuts import render
from django.http import HttpResponse
from index.models import Pizza

# Create your views here
def index(request):
    context = { "pizzalist": Pizza.objects.all()}
    return render(request, 'login.html', context) 