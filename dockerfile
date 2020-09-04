from ubuntu
COPY simpleApp /simpleApp
WORKDIR /simpleApp
RUN apt-get update && apt-get install -y \
    python3.7 \
    python3-pip
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
RUN python3.6 manage.py runserver 0.0.0.0:8000

