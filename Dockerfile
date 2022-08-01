FROM alpine

RUN apk add --no-cache nano ansible git openssh bash

#The following are needed for aws-cli
RUN apk add python3 py3-pip py3-boto3
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir awscli

RUN rm -rf /var/cache/apk/*

# Create app directory
WORKDIR /app

#Copy config files
COPY . .

#Making the shell script excutable
RUN chmod +x nani.sh

#copying ansible config file
RUN mkdir /etc/ansible
COPY ansible.cfg /etc/ansible