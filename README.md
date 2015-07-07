# docker-fastboot
Lets you run the Android Fastboot tool in a Docker container.

# Setup

1. Clone this repository.

        git clone --recursive https://github.com/mparker17/docker-fastboot.git
        cd docker-fastboot

2. Build an image.

        docker build -t fastboot .

# Usage

1. Run the image.

        docker run --privileged -v /dev/bus/usb:/dev/bus/usb --rm -ti fastboot

    ... this will spawn a shell in the container which will let you run fastboot
    commands.

    To run a fastboot command directly, add it to the end of the `docker run`
    line. For example, to list connected devices:

        docker run --privileged -v /dev/bus/usb:/dev/bus/usb --rm -ti fastboot fastboot devices

# Notes

This has only been tested on a Linux system. If you're using something like
boot2docker, your USB devices might not be properly mapped.
