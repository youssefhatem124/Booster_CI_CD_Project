from ubuntu
COPY simpleApp /simpleApp
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y python3.6 python3.6-dev python3-pip
RUN apt-get install -y pkg-config
RUN mkdir /simpleapp
WORKDIR /simpleApp
COPY requirements.txt /simpleapp/ 
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
RUN python3.6 manage.py runserver 0.0.0.0:8000
COPY . /simpleapp/
