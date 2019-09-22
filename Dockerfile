FROM ubuntu:19.04

LABEL maintainer="Felix Gündling <felix.guendling@gmail.com>"

RUN apt update \
    && apt upgrade -y \
    && apt install -y --no-install-recommends \
        cmake \
        g++-powerpc-linux-gnu \
        ninja-build \
        qemu-user-static \
    && rm -rf /var/cache/apk/* \
    && echo 'cmake -GNinja -DCMAKE_TOOLCHAIN_FILE=/toolchain-ppc.cmake "$@"' > /bin/cmake-ppc \
    && chmod +x /bin/cmake-ppc

COPY toolchain-ppc.cmake /toolchain-ppc.cmake

WORKDIR /root
