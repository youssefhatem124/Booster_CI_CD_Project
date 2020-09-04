from python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /simpleapp
COPY simpleApp /simpleApp

WORKDIR /simpleApp
COPY requirements.txt /simpleapp/ 
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
RUN python3.6 manage.py runserver 0.0.0.0:8000
COPY . /simpleapp/
