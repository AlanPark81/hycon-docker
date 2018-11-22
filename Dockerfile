FROM ubuntu:18.04
MAINTAINER jbam 

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y curl git wget make gcc build-essential libboost-dev libudev-dev libusb-dev vim 

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN mkdir -p /app
RUN cd /app
WORKDIR /app

RUN git clone https://github.com/team-hycon/hycon-core
RUN cd hycon-core/

WORKDIR /app/hycon-core/
RUN npm i

COPY config.json ./data/
ENV SOURCE_DIR=/app/hycon-core
RUN mkdir -p /scripts
RUN cd /scripts

WORKDIR /scripts
COPY run.sh ./
RUN cat run.sh
RUN chmod 700 run.sh

EXPOSE 8148
EXPOSE 2442
EXPOSE 9081

CMD ["/scripts/run.sh"]
#If you want start automatically use ENTRYPOINT
#ENTRYPOINT ["/scripts/run.sh"]
