FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y curl make git-core cmake python-is-python3 sudo wget bzip2 tar xz-utils g++ bsdmainutils

ENV VITASDK=/usr/local/vitasdk
ENV PATH=$VITASDK/bin:$PATH

RUN git clone https://github.com/vitasdk/vdpm && \
        cd vdpm && \
        ./bootstrap-vitasdk.sh && \
        ./install-all.sh

COPY . /build
WORKDIR /build

RUN bash ./build_deps.sh
# CMD [ "make", "TARGET_VITA=1", "VERSION=eu", "vpk" ]
