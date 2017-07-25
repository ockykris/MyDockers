FROM kristant/trusty-ubuntu

MAINTAINER Ocky Kristanto <ockykris@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV LANG en_US.UTF-8

RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update && \
    apt-get install --no-install-recommends -y openjdk-8-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/java"]
