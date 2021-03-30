FROM ubuntu:18.04
USER root
RUN apt-get update -qq
RUN apt-get install python3-pip -qq
RUN apt install python3-pip
ADD . /simpleApp
WORKDIR /simpleApp
RUN apt-get update -qq
EXPOSE 8001
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]
