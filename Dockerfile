#Pull base image
FROM    ubuntu:14.04

MAINTAINER Eric Irwin <eric.irwin1124@gmail.com>

# Bundle app source
COPY . /src

#Install dependencies
RUN sudo apt-get update
RUN sudo apt-get install -y nodejs
RUN sudo apt-get install -y npm
RUN cd /src; npm install
RUN npm install redis

#Expose Ports for container-linking
EXPOSE  8080


CMD ["nodejs", "/src/index.js"]
