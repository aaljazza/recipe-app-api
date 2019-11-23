FROM python:3.7-alpine
MAINTAINER Jazzaf

ENV PYTHONUNBUFFERED 1
# create environment

COPY ./requirements.txt /requirements.txt
# get requirements file

RUN pip install -r /requirements.txt
# run requirements download
RUN mkdir /app
# run the app

WORKDIR /app
COPY ./app /app
# go to the app folder and create an image of it

RUN adduser -D user
USER user
# create an operational user to run the app and run as the user



# to run the above code you need to use the following code $ docker build .
