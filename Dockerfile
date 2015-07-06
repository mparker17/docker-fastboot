FROM ubuntu:14.04
MAINTAINER M Parker <mparker17@536298.no-reply.drupal.org>

RUN apt-get -y -qq update
RUN apt-get -y install android-tools-fastboot

