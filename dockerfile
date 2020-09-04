from ubuntu
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
RUN mkdir /simpleapp
COPY simpleApp /simpleApp

WORKDIR /simpleApp
RUN  pip install virtualenv
RUN pip freeze > requirements.txt
COPY requirements.txt /simpleapp/ 
RUN pip3 install -r requirements.txt
COPY . /simpleApp/
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
RUN python3 manage.py runserver 0.0.0.0:8000
