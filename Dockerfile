FROM ubuntu:18.04

LABEL maintainer="Felix Gündling <felix.guendling@gmail.com>"

RUN apt update \
    && apt install -y --no-install-recommends \
        cmake \
        g++-powerpc-linux-gnu \
        make \
        qemu-user-static \
        binfmt-support \
        debootstrap \
    && rm -rf /var/cache/apk/* \
    && debootstrap --foreign --no-check-gpg --arch=powerpc xenial /ppc-root http://ports.ubuntu.com/ \
    && cp /usr/bin/qemu-ppc-static /ppc-root/usr/bin/ \
    && chroot /ppc-root /debootstrap/debootstrap --second-stage

WORKDIR /root
