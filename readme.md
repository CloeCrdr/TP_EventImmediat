# TP_EVENT IMMEDIAT 

## Requirements

### Install the project 

#### Create the folder
django-admin startproject tp_EventImmediat
#### Select the folder
cd tp_EventImmediat  

#### Create Live Environment
python3 -m venv LiveEnv 
#### Activate environment
source LiveEnv/bin/activate  

#### install django
pip install django     
pip install --upgrade pip  

#### start app
python manage.py startapp LiveApp 
#### run server
python3 manage.py runserver

#### install mysql connector
pip install mysql-connector-python

#### install pillow (for image uploads)
python -m pip install Pillow


LiveEnv/lib/python3.11/site-packages/django/conf/global_settings.py has been modified on lines 527 and 539 to change path for login and profile :

- LOGIN_URL = "/login/"

- LOGIN_REDIRECT_URL = "/profile/"

#### Database settings and credentials

In order to set the database credentials, please, go to tp_EventImmediat/settings.py and change the following datas with your own informations : 

'NAME': 'event_immediat',
'USER': 'root',
'PASSWORD': 'root',
'HOST': 'localhost',
'PORT': '8889',

If you use the provided MySQL database, you can use this accounts : 

- Account admin : 
<USERNAME> : Admin
<PASSWORD> : projetdjango1

- Account user : 
<USERNAME> : User 
<PASSWORD> : test1234567890

If you don't, please do the migrations of the models : 
- python3 manage.py makemigrations
- python3 manage.py migrate

And create your user or superuser.



## Specifities
### Access rights
- a non logged user can see home page and list of events but cannot see an event details
- a non logged user can logged themselves or register
- a logged user without staff or superuser rights can create an event
- a logged user without staff or superuser rights can see their profile
- a logged user without staff or superuser rights can update profile and password
- a logged user without staff or superuser rights can register to an event
- a logged user without staff or superuser rights can delete their registration to an event
- a logged user with staff or superuser rights can do the same that a non staff or superuser logged user 
- a logged user with staff or superuser rights can update an event
- a logged user with staff or superuser rights can delete an event