from ubuntu
COPY simpleApp /simpleApp
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y python3.6 python3.6-dev python3-pip
RUN pip3 freeze > requirements.txt
RUN pip3 install -r requirements.txt
WORKDIR /simpleApp
RUN apt install libcairo2-dev pkg-config python3-dev
RUN  pip install pycairo
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
RUN python3.6 manage.py runserver 0.0.0.0:8000

