from django import forms
from django.core.exceptions import ValidationError
from index.models import Area
from index.models import Customer

class Login_Form(forms.Form):
    username = forms.CharField(label="Username", max_length=45)
    password = forms.CharField(label="Password", widget=forms.PasswordInput())

    def clean(self):
        cleaned_data = super().clean()
        entered_username = cleaned_data['username']
        entered_password = cleaned_data['password']

        temp_user_list = Customer.objects.filter(username=entered_username)
        if temp_user_list.exists() and temp_user_list.count() == 1:
            temp_user = temp_user_list.first()
            if temp_user.password == entered_password:
                return

        raise ValidationError(
            "Incorrect login details; please try again",
            code = "incorrect credentials"
        )

class Register_Form(forms.Form):
    username = forms.CharField(label="Username", max_length=45)
    password = forms.CharField(label="Password", widget=forms.PasswordInput())
    confirm_password = forms.CharField(label="Confirm Password", widget=forms.PasswordInput())
    name = forms.CharField(label="Full Name", max_length=45)
    address = forms.CharField(label = "Address", max_length=45)
    areas = [(i.id, str(i)) for i in list(Area.objects.all())]
    area_code = forms.ChoiceField(label="Area Code", choices=areas)
    
    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data['password']
        confirm_password = cleaned_data['confirm_password']
        name = cleaned_data['name']
        address = cleaned_data['address']
        area_code = cleaned_data['area_code']
        # Check if both passwords correspond
        if password != confirm_password:
            raise ValidationError(
                "Passwords do not match!",
                code = "different passwords"
            )
        # Check if username already exists
        if Customer.objects.filter(username=self.cleaned_data['username']).exists():
            raise ValidationError(
                "Username already present. Please change username!",
                code = "username already exists"
            )
