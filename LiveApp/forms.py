from django import forms
from .models import Event
from django.contrib.auth.forms import UserCreationForm, UserChangeForm, PasswordChangeForm
from django.contrib.auth.models import User

class EventForm(forms.ModelForm):
    class Meta:
        model = Event
        forms.DateField(widget=forms.DateInput)
        fields = ['title', 'description', 'date', 'place', 'image', 'organizer']
        widgets = {
            'image': forms.ClearableFileInput(),
            'date': forms.DateInput(attrs={'type': 'date'})
        
        }


class CustomUserCreationForm(UserCreationForm):
    first_name = forms.CharField(max_length=30)
    last_name = forms.CharField(max_length=30)
    email = forms.CharField(max_length=30)

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2']

class CustomUserChangeForm(UserChangeForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['password'].help_text = ''
        self.fields['password'].widget = forms.HiddenInput()
    class Meta:
        model = User
        fields = ['username', 'email']

class CustomPasswordChangeForm(PasswordChangeForm):
    class Meta:
        model = User
