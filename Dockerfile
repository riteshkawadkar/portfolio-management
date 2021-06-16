#List of instructions to build docker image
#With dockerfile we are creating a image on top of the image

#Image we are inheriting
FROM python:3.9-alpine

#Docker unbuffered env, it tells python to run in unbuffered mode, thats is not to show all o/p
ENV PYTHONUNBUFFERED 1

# Install dependencies, create dependecies in requirements.txt
# copy from here to docker image
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Setup directory structure, this is used to store our app source code
#create an empy folder app on our docker image
RUN mkdir /app

#switch to /app
WORKDIR /app

#copy code from local machine to docker image
COPY ./app /app

#create a user which will run our image, -D = for running app only
RUN adduser -D user

#switch to user, for security purpose, otherwise it will run from root acc.
USER user