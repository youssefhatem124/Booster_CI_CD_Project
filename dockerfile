from ubuntu
COPY simpleApp /simpleApp
RUN apt-get update && apt-get install -y \
    python3.7 \
    python3-pip
RUN pip freeze > requirements.txt
RUN pip3 install -r requirements.txt
WORKDIR /simpleApp
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
RUN python3.6 manage.py runserver 0.0.0.0:8000

