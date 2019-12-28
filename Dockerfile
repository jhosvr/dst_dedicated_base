FROM ubuntu:18.04

RUN apt-get clean \
    && apt-get update \
    && apt-get install -y locales \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/apt/lists/*
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN dpkg --add-architecture i386 \
  && apt-get update -y \
  && apt-get install -y \
    lib32gcc1 \
    lib32stdc++6 \
    ca-certificates \
    libcurl4-gnutls-dev:i386 \
    wget \
  && useradd -m -G games -s /bin/bash dst \
  && rm -rf /var/apt/lists/*

USER dst
ENV HOME /home/dst
RUN mkdir $HOME/steamcmd \
  && cd $HOME/steamcmd \
  && wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" \
  && tar xzf steamcmd_linux.tar.gz

WORKDIR $HOME
COPY --chown=dst:dst run_dedicated_servers.sh .
RUN chmod +x run_dedicated_servers.sh
COPY --chown=dst:dst .klei .

ENTRYPOINT $HOME/run_dedicated_servers.sh
