from ubuntu
RUN apt install python3.6
RUN apt install python3-pip
RUN mkdir /simpleapp
COPY simpleApp /simpleApp

WORKDIR /simpleApp
COPY requirements.txt /simpleapp/ 
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
RUN python3.6 manage.py runserver 0.0.0.0:8000
COPY . /simpleapp/
