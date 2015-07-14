FROM ubuntu:14.04
MAINTAINER M Parker <mparker17@536298.no-reply.drupal.org>

RUN apt-get -y update && \
    apt-get -y install android-tools-fastboot

