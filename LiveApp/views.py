from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, get_list_or_404, get_object_or_404, redirect

# Modules 
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.forms import UserChangeForm, PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordResetForm
from django.contrib.auth.views import PasswordResetView, PasswordResetDoneView, PasswordResetConfirmView, PasswordResetCompleteView

from django.views.generic.edit import FormMixin


from .forms import EventForm, CustomUserCreationForm, CustomUserChangeForm, CustomPasswordChangeForm
from .models import Event, UserEvent

from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from .mixins import UpdateEventMixin
from django.views import View

from django.utils import timezone
from django.core.paginator import Paginator

# Create your views here.

# homepage
def home(request):
    # filter previous events so they're not displayed
    current_date = timezone.now()
    events = Event.objects.filter(date__gte=current_date).order_by('date')[:4]
    latest_users = UserEvent.objects.select_related('user', 'event').filter(event__date__gte=current_date).order_by('-registration_date')[:3]

    return render(request, 'LiveApp/home.html', {'events': events, 'latest_users': latest_users})

# registration
def registration(request): 
    """
    This function allows new user creation. It uses the Django UserCreationForm and the Django login function that allows a user to be logged after its registration."""

    if request.method == "POST":
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user.save()
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect("LiveApp:login")
        else: 
            return render(request, 'LiveApp/registration.html', {"form": form})
    else: 
        form = CustomUserCreationForm()
        return render(request, 'LiveApp/registration.html', {'form': form})

# LogIn
def user_login(request):
    """This function allows the existing user to connect to the website and to redirect it to the homepage with its own informations"""
    if request.method == "POST":
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect("LiveApp:home")
        else: 
            return render(request, 'LiveApp/login.html', {'form': form, 'erreur': "Nom d'utilisateur ou mot de passe incorrect"})
    else:
        form = AuthenticationForm()
        return render(request, 'LiveApp/login.html', {'form': form})

# LogOut
def user_logout(request):
    logout(request)
    return render(request, "LiveApp/logout.html")

# list of all events // already in def home:
def events_list(request):
    current_date = timezone.now()
    # filter previous events so they're not displayed
    events = Event.objects.filter(date__gte=current_date).order_by('date')
    paginator = Paginator(events, 8)

    page_number = request.GET.get('page')
    page = paginator.get_page(page_number)

    return render(request, 'LiveApp/list_events.html', {'page': page})

# create an event
def create_event(request):
    if request.method == 'POST':
        form = EventForm(request.POST, request.FILES)

        if form.is_valid():
            form.save()
            return redirect('LiveApp:events_list')
    else:
        form = EventForm()

    return render(request, 'LiveApp/create_event.html', {'form': form})

# see an event with mixin permission if logged 
class DetailEventView(LoginRequiredMixin, View):
    def get(self, request, id):
        event = get_object_or_404(Event, id=id)
        event_user = UserEvent.objects.filter(event=event).order_by('-registration_date')
        user_in_event = UserEvent.objects.filter(event=event, user=request.user).exists()
        return render(request, 'LiveApp/detail_event.html', {'event': event, 'users': event_user, 'user_in_event': user_in_event})


# update an event 
class UpdateEventView(LoginRequiredMixin, UpdateEventMixin, FormMixin, View):
    template_name = 'LiveApp/update_event.html'
    form_class = EventForm

    def get(self, request, *args, **kwargs):
        event = self.get_object()
        form = self.get_form()
        return render(request, self.template_name, {'form': form, 'event': event})

    def post(self, request, *args, **kwargs):
        event = self.get_object()
        form = self.get_form()
        if form.is_valid():
            form.instance = event
            form.save()
            return redirect('LiveApp:detail_event', event.id)
        return render(request, self.template_name, {'form': form, 'event': event})

    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        kwargs['instance'] = self.get_object()
        return kwargs

    def get_object(self):
        id = self.kwargs.get('id')
        return get_object_or_404(Event, pk=id)

def update_event(request, id):
    event = get_object_or_404(Event, pk=id)
    if request.method == 'POST':
        form = EventForm(request.POST, instance=event)
        if form.is_valid():
            form.save()
            return redirect('LiveApp:detail_event', event.id)
    else:
        form = EventForm(instance=event)
    
    return render(request, 'LiveApp/update_event.html', {'form': form, 'event': event})


# delete an event (with javascript - jsonResponse)
def delete_event(request, id):
    event = get_object_or_404(Event, pk=id)
    event.delete()
    return JsonResponse({'message': 'L\'événement a été supprimé avec succès.'})


# subscribe an user to an event
def add_user_event(request, id):
    event = get_object_or_404(Event, id=id)

    if request.method == 'POST':
        user = request.user  # Utilisateur connecté

        # Vérifier si un enregistrement avec le même user_id existe déjà
        if UserEvent.objects.filter(event=event, user=user).exists():
            response_data = {'error': True, 'message': 'Vous êtes déjà inscrit à cet événement.'}
            return JsonResponse(response_data, status=400)

        # Ajouter l'enregistrement si aucun enregistrement existant n'est trouvé
        UserEvent.objects.create(event=event, user=user)
        response_data = {'error': False, 'message': 'Félicitations, votre inscription a bien été prise en compte.'}
        return JsonResponse(response_data, status=200)

    return redirect('LiveApp:detail_event', id=event.id)

# unsubscribe an user to an event 
def remove_user_event(request, id):
    event = get_object_or_404(Event, id=id)
    user = request.user

    try:
        user_event = UserEvent.objects.get(event=event, user=user)
        user_event.delete()
        response_data = {'error': False, 'message': 'Votre désinscription a bien été prise en compte.'}
        return JsonResponse(response_data, status=200)
    except UserEvent.DoesNotExist:
        response_data = {'error': True, 'message': 'Vous n\'êtes pas inscrit à cet événement.'}
        return JsonResponse(response_data, status=400)


# see your profile 

class ProfileView(LoginRequiredMixin, View):
    def get(self, request):
        user = request.user
        return render(request, 'LiveApp/profile.html', {'user': user})

# Edit profile but only if logged
class EditProfileView(LoginRequiredMixin, View):
    def get(self, request):
        form = CustomUserChangeForm(instance=request.user)
        return render(request, 'LiveApp/edit_profile.html', {'form': form})
    
    def post(self, request):
        form = CustomUserChangeForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('LiveApp:profile')
        else:
            return render(request, 'LiveApp/edit_profile.html', {'form': form})

# edit password but only if logged
class EditProfilePassView(LoginRequiredMixin, View):
    def get(self, request):
        form = PasswordChangeForm(request.user)
        return render(request, 'LiveApp/edit_password.html', {'form': form})
    
    def post(self, request):
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            return redirect('LiveApp:profile')
        else:
            return render(request, 'LiveApp/edit_password.html', {'form': form})


# classes to reset password
# view when clicking on "Forgot password ?"
class CustomPasswordResetView(PasswordResetView):
    template_name = 'LiveApp/password_reset.html'
    email_template_name = 'LiveApp/password_reset_email.html'
    success_url = '/password_reset/done/'
    form_class = PasswordResetForm

# view for instructions to check mail
class CustomPasswordResetDoneView(PasswordResetDoneView):
    template_name = 'LiveApp/password_reset_done.html'

# view to confirm the reset password (with inputs to change password and confirm it)
class CustomPasswordResetConfirmView(PasswordResetConfirmView):
    template_name = 'LiveApp/password_reset_confirm.html'
    success_url = '/reset/done'

# view to complete the reset of the password with a login url
class CustomPasswordResetCompleteView(PasswordResetCompleteView):
    template_name = 'LiveApp/password_reset_complete.html'
