from django import forms
from django.core.exceptions import ValidationError
from index.models import Area

class User_Form(forms.Form):
    username = forms.CharField(label="Username", max_length=45)
    password = forms.CharField(label="Password", widget=forms.PasswordInput())
    confirm_password = forms.CharField(label="Confirm Password", widget=forms.PasswordInput())
    name = forms.CharField(label="Full Name", max_length=45)
    address = forms.CharField(label = "Address", max_length=45)
    areas = [(str(i), str(i)) for i in list(Area.objects.all())]
    area_code = forms.ChoiceField(choices=areas)
    
    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data['password']
        confirm_password = cleaned_data['confirm_password']
        print(f"Password: {password}")
        if password != confirm_password:
            raise ValidationError(
                "Passwords do not match!",
                code = "different passwords"
            )
