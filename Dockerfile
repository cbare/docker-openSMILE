FROM ubuntu:trusty

MAINTAINER J. Christopher Bare christopherbare@gmail.com

RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    build-essential \
    libtool \
    pkg-config \
    wget \
    && apt-get clean

RUN wget http://www.audeering.com/research-and-open-source/files/openSMILE-2.1.0.tar.gz \
    && tar xvf openSMILE-2.1.0.tar.gz \
    && rm openSMILE-2.1.0.tar.gz

RUN cd openSMILE-2.1.0 \
    && sed -i '/chmod/async; sleep 1' buildStandalone.sh \
    && ./buildStandalone.sh -p /usr/local

## The command 'bash buildStandalone.sh' fails with the following error:
## chmod: cannot access 'configure': No such file or directory
## buildStandalone.sh: ./autogen.sh: /bin/bash: bad interpreter: Text file busy
## see: https://github.com/docker/docker/issues/9547
## solution is to add sleeps or 'sync' commands into install script
## but I don't really want to hack openSMILE's install script, so
## I'm just going the route of manually creating an image
