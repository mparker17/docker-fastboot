FROM ubuntu:18.04

RUN apt-get -y update && \
    apt-get -y install fastboot

VOLUME [ "/dev/bus/usb", "/fastboot" ]
WORKDIR /fastboot

# Run fastboot by default, with "help" as the default argument. This can be
# overridden at `docker run`-time. See README for more information.
ENTRYPOINT [ "fastboot" ]
CMD [ "help" ]
