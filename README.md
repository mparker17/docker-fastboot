# docker-fastboot

Use Docker to run the Android Fastboot tool.

# Set up

1. Clone this repository:

        git clone --recursive https://github.com/mparker17/docker-fastboot.git
        cd docker-fastboot/

2. Build an image:

        docker build -t fastboot .

# Use

1. Run fastboot.
    Replace `$subcommand` with the fastboot sub-command you want to run.

        docker run --rm -ti --privileged -v /dev/bus/usb:/dev/bus/usb -v $PWD:/fastboot fastboot $subcommand

    For example, to list connected devices:

        docker run --rm -ti --privileged -v /dev/bus/usb:/dev/bus/usb -v $PWD:/fastboot fastboot devices

    You can leave out `$subcommand` to run `fastboot help`:

        docker run --rm -ti --privileged -v /dev/bus/usb:/dev/bus/usb -v $PWD:/fastboot fastboot

    Passing `-v $PWD:/fastboot` maps the current directory to `/fastboot` in the container, so you can access files in the current directory.
    Note the working directory is `/fastboot` by default, so you can refer to files in the current directory using relative paths:

        docker run --rm -ti --privileged -v /dev/bus/usb:/dev/bus/usb -v $PWD:/fastboot fastboot update ./update.img

# Debugging

If you run into problems, you can run a shell in the container with:

        docker run --rm -ti --privileged -v /dev/bus/usb:/dev/bus/usb -v $PWD:/fastboot --entrypoint /bin/bash fastboot

To run a root shell, add `-u root`:

        docker run --rm -ti --privileged -v /dev/bus/usb:/dev/bus/usb -v $PWD:/fastboot --entrypoint /bin/bash -u root fastboot

For more information, see [the Docker run reference](https://docs.docker.com/reference/run/).

# Notes

This has only been tested on a Linux system. If you're using something like boot2docker, your USB devices might not be properly mapped.
