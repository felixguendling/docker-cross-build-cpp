FROM ubuntu:18.04

LABEL maintainer="Felix Gündling <felix.guendling@gmail.com>"

RUN apt update \
    && apt install -y --no-install-recommends \
        cmake \
        g++-powerpc-linux-gnu \
        make \
        qemu-user-static \
        binfmt-support \
    && rm -rf /var/cache/apk/*

ENV CC=/usr/bin/powerpc-linux-gnu-gcc
ENV CXX=/usr/bin/powerpc-linux-gnu-g++
ENV AR=/usr/bin/powerpc-linux-gnu-ar
ENV LD=/usr/bin/powerpc-linux-gnu-ld

WORKDIR /root

CMD /bin/bash
