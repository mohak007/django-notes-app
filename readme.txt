NotesApp Django Project - Setup Instructions
Project Overview

This Django project is set up with:

Django 5.2.8

Django REST Framework

CORS Headers

WhiteNoise (for static files)

MySQL database

Gunicorn (for production use)

The app runs inside a guest Ubuntu VM, and the host machine can access it via the guest's IP address.

Prerequisites

Ubuntu VM with Python 3.12 installed

MySQL installed on the VM

Virtual environment (venv) recommended

Step-by-Step Setup
1. Create Virtual Environment
python3 -m venv venv
source venv/bin/activate

2. Upgrade pip
pip install --upgrade pip

3. Install Required Packages
pip install -r requirements.txt


requirements.txt includes:

asgiref==3.7.2

Django==5.2.8

django-cors-headers==4.9.0

djangorestframework==3.16.1

gunicorn==21.2.0

pytz==2023.3

sqlparse==1.0.5

tzdata==2023.3

whitenoise==7.1.0

mysqlclient==2.2.7

Note: For mysqlclient, install dependencies on Ubuntu:

sudo apt update
sudo apt install python3-dev default-libmysqlclient-dev build-essential

4. Configure MySQL

Create a database for the project.

Update settings.py with correct database credentials:

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'your_db_name',
        'USER': 'your_db_user',
        'PASSWORD': 'your_db_password',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}

5. Apply Migrations
python manage.py makemigrations
python manage.py migrate

6. Run the Development Server
python manage.py runserver 0.0.0.0:8000


Server runs on all interfaces (0.0.0.0) to allow access from host machine.

Access from host: http://<guest_vm_ip>:8000/

Troubleshooting / Fixes Done

Installed missing Python modules:

djangorestframework

django-cors-headers

whitenoise

mysqlclient

Fixed MySQL connection issues:

Installed MySQL dev packages (python3-dev, default-libmysqlclient-dev)

Corrected DB credentials in settings.py

Configured Django to run on guest VM IP for host access.

Created/activated virtual environment to avoid system package conflicts.

Updated requirements.txt to include all necessary dependencies.

Notes

Development server is not for production; use Gunicorn + Nginx for production deployment.

Make sure the firewall allows incoming connections to port 8000 if accessing from host.
