from ubuntu
COPY simpleApp /simpleApp
WORKDIR /simpleApp
RUN set -xe \
    && apt-get update \
    && apt-get install python-pip
RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
RUN python3.6 manage.py runserver 0.0.0.0:8000
