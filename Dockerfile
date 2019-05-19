FROM ubuntu:18.04

LABEL maintainer="Felix Gündling <felix.guendling@gmail.com>"

RUN apt update \
    && apt-upgrade \
    && apt install -y --no-install-recommends \
        cmake \
        g++-powerpc-linux-gnu \
    && rm -rf /var/cache/apk/*

WORKDIR /root
