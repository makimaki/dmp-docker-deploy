FROM openjdk:8
MAINTAINER Yuta Sakamaki <yuta_sakamaki@albert2005.co.jp>

ENV LANG ja_JP.UTF-8

ENV ANSIBLE_VER 1.4.3
ENV AWS_CLI_VER 1.7.23
ENV VAGRANT_VER 1.8.5

RUN apt-get update

# Python (pip)
RUN apt-get -y install python python-pip

# Ansible
RUN apt-get -y install build-essential libssl-dev libffi-dev python-dev libyaml-dev && \
  pip install -U cffi && \
  pip install ansible==${ANSIBLE_VER}

# AWS CLI
RUN pip install awscli==${AWS_CLI_VER}

# Vagrant
RUN apt-get -y install curl && \
  curl -sSL https://releases.hashicorp.com/vagrant/${VAGRANT_VER}/vagrant_${VAGRANT_VER}_x86_64.deb -o /tmp/vagrant.deb && \
  dpkg -i /tmp/vagrant.deb && rm /tmp/vagrant.deb && \
  vagrant plugin install vagrant-aws
