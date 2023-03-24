# listing docker images
docker images

# pulling the Ubuntu:18.04 image
docker pull ubuntu:18.04

# running a tagged Docker image
docker run -t -i --name new_container ubuntu:18.04 /bin/bash

# pulling the fedora image
docker pull fedora:21

# viewing the fedora image
docker images fedora

# searching for images
docker search puppet

# pulling down the jamtur01/puppetmaster image
docker pull jamtur01/puppetmaster

# logging into the Docker Hub
docker login

# creating a custom container to modify
docker run -i -t ubuntu /bin/bash

	# adding the Apacher package
	apt-get -yqq update
	apt-get -y install apache2

# commititng the custom container
docker commit 4aab3ce3cb76 jamtur01/apache2

# reviewing the new commited image
docker images jamtur01/apache2

# commiting a container with a message, author and tag
docker commit -m "A new custom image" -a "James Turnbill" 4aab3ce3cb76 jamtur01/apache2:webserver

# inspecting the commited image
docker inspect jamtur01/apache2:webserver

# running a container from a commited image
docker run -t -i jamtur01/apache2:webserver /bin/bash


## Building images with a Dockerfile

# a template Dockerfile
# Version: 0.0.1
FROM ubuntu:18.04
LABEL maintainer="james@example.com"
RUN apt-get update; apt-get install -y nginx
RUN echo 'Hi, I am in your container' > /var/www/html/index.html
EXPOSE 80

# building an image from a Dockerfile
docker build -t="jamtur01/static_web" .
# -t -mark the resulting image with a repository and a name
# . - look in the local directory for the Dockerfile

# tagging a build
docker build -t="jamtur01/static_web:v1" .
# default tag is 'latest'

# building from a Git repository
docker build -t="jamtur01/static_web:v1" github.com/turnbullpress/docker-static_web

# bypassing the Dockerfile build cache
docker build --no-cahce -t="jamtur01/static_web" .


# a template Dockerfile
FROM ubuntu:18.04
LABEL maintainer="james@example.com"
ENV REFRESHED_AT 2016-07-01
RUN apt-get -qq update

# a template Fedore Dockerfile
FROM fedora:21
LABEL maintainer="james@example.com"
ENV REFRESHED_AT 2016-07-01
RUN yum -q makecache

# listing the new Docker image
docker images jamtur01/static_web

# using the docker history command
docker history 22d47c8cb6e5

# launching a container from the new image
docker run -d -p 80 --name static_web jamtur01/static_web nginx -g "daemon off;"
# -d run Docker detached in the background
# nginx -g "daemon off;" this is the command for the container to run
# -p this flag manages the network port; this is the port that maps to port 80 on the container

# viewing the Docker port mapping
docker ps -l
# or
docker port 6751b94bb5c0 80

# the docker port command with container name
docker port static_web 80

# exposing a specific port with -p
docker run -d -p 80:80 --name static_web_80 jamtur01/static_web nginx -g "daemon off;"
# only one container can bind to a specific port on the local host

# binding to a different port
docker run -d -p 8080:80 --name static_web_8080 jamtur01/static_web nginx -g "daemon off;"
# this binds port 80 on the container to port 8080 on the local host

# binding to a specific interface
docker run -d -p 127.0.0.1:80:80 --name static_web_lb jamtur01/static_web nginx -g "daemon off;"
# port 80 of the container to port 80 on the 127.0.0.1 interface on the local host

# binding a random port on a specific interface
docker run -d -p 127.0.0.1::80 --name static_web_random0 jamtur01/static_web nginx -g "daemon off;"

# exposing a port with docker run
docker run -d -P --name static_web_all jamtur01/static_web nginx -g "daemon off;"
# this publishes port 80 on a random port on out local host. It also publishes any additional ports
# that are specified with other EXPOSE instructions in the Dockerfile that built our image



