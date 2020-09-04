from ubuntu
RUN apt-get update -qq
RUN apt-get -y install python3.6
RUN apt -y install python3-pip
RUN mkdir /simpleapp
COPY . /simpleApp/
WORKDIR /simpleApp
RUN pip3 install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
RUN python3 manage.py runserver 0.0.0.0:8000
