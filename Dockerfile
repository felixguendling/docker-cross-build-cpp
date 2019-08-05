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
    && sudo debootstrap --foreign --no-check-gpg --arch=powerpc xenial /ppc-root http://ports.ubuntu.com/ \
    && sudo mount -t proc /proc /ppc-root/proc \
    && sudo cp /usr/bin/qemu-ppc-static /ppc-root/usr/bin/ \
    && sudo chroot /ppc-root /debootstrap/debootstrap --second-stage

WORKDIR /root
