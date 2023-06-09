from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.shortcuts import render

class LoginRequiredDetailEventMixin(LoginRequiredMixin):
    login_url = '/login/' 
    redirect_field_name = 'redirect_to' 
    

class UpdateEventMixin(UserPassesTestMixin):
    login_url = '/login/' 
    redirect_field_name = 'redirect_to' 

    def test_func(self):
        user = self.request.user
        return user.is_authenticated and (user.is_superuser or user.is_staff)

    def handle_no_permission(self):
        return render(self.request, 'LiveApp/error.html')