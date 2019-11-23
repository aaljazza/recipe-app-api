FROM python:3.7-alpine
MAINTAINER Jazzaf

ENV PYTHONUNBUFFERED 1
# create environment

COPY ./requirements.txt /requirements.txt
# get requirements file

RUN apk add --update --no-cache postgresql-client
# uses package manager named apk and add a package and updated it but dont store the registry index on the docker. 
# This minimizes the number of extra files on the Docker container (get to a small docker size without extra dependencies)

RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
# create a virtual environment that will be later removed

RUN pip install -r /requirements.txt
# run requirements download

RUN apk del .tmp-build-deps
# delete temporary environments that were created

RUN mkdir /app
# run the app

WORKDIR /app
COPY ./app /app
# go to the app folder and create an image of it

RUN adduser -D user
USER user
# create an operational user to run the app and run as the user



# to run the above code you need to use the following code $ docker build .
