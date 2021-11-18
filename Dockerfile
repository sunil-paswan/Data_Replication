FROM ubuntu:latest
RUN apt-get update
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get install wget gnupg gnupg1 gnupg2 -y
RUN wget https://www.postgresql.org/media/keys/ACCC4CF8.asc 
RUN apt-key add ACCC4CF8.asc
RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install postgresql-13 -y && apt-get install netcat telnet  -y
RUN apt-get install vim -y