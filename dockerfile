from ubuntu
COPY simpleApp /simpleApp
RUN pip3 install -r requirements.txt
WORKDIR /simpleApp
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
RUN python3.6 manage.py runserver 0.0.0.0:8000
