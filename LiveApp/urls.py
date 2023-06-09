from django.urls import path
from .views import DetailEventView, CustomPasswordResetView, CustomPasswordResetDoneView, CustomPasswordResetConfirmView, CustomPasswordResetCompleteView, ProfileView, EditProfileView, EditProfilePassView, UpdateEventView

from . import views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views

app_name = 'LiveApp'

urlpatterns = [
    path('', views.home, name='home'),

    # registration ; login & logout
    path('signup/', views.registration, name="signup"),
    path('login/', views.user_login, name="login"),
    path('logout/', views.user_logout, name="logout"),

    # routes to manage events 
    path('events/', views.events_list, name="events_list"),
    path('create/event', views.create_event, name="create_event"),
    path('update/event/<int:id>', UpdateEventView.as_view(), name="update_event"),
    path('delete/event/<int:id>/', views.delete_event, name='delete_event'),

    # route without mixin
    # path('event/<int:id>', views.detail_event, name="detail_event"),
    # route with mixin
    path('event/<int:id>', DetailEventView.as_view(), name='detail_event'),
    path('login/', auth_views.LoginView.as_view(), name='login'),
    
    # routes to manage events-users 
    path('add/event/user/<int:id>/', views.add_user_event, name='add_user_event'),
    path('remove/event/user/<int:id>/', views.remove_user_event, name='remove_user_event'),

    # routes to manage auth_user
    path('profile/', ProfileView.as_view(), name="profile"),
    path('profile/edit/', EditProfileView.as_view(), name='edit_profile'),
    path('password/edit/', EditProfilePassView.as_view(), name="edit_password" ),

    # routes to reset password 
    path('password_reset/', CustomPasswordResetView.as_view(), name='password_reset'),
    path('password_reset/done/', CustomPasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/confirm/<uidb64>/<token>/', CustomPasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset/done/', CustomPasswordResetCompleteView.as_view(), name='password_reset_complete'),
   
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)