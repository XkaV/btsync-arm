FROM hypriot/rpi-node
MAINTAINER Erik Kellener (erik@@kellener.com)

# Based on Adrien Duermael (adrien@duermael.com)

ENV DEBIAN_FRONTEND noninteractive

########## BTSYNC ##########

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install curl -y
#Not working for ARMHF substitute node link
#RUN apt-get install nodejs -y
RUN ln -s /usr/local/bin/node /usr/bin/nodejs

RUN curl -o /usr/bin/btsync.tar.gz https://download-cdn.resilio.com/stable/linux-armhf/resilio-sync_armhf.tar.gz 
RUN cd /usr/bin; tar xvzf btsync.tar.gz; rm btsync.tar.gz;
RUN ln -s /usr/bin/rslsync /usr/bin/btsync
ADD btsync /btsync
RUN mkdir /btsync/storage

EXPOSE 55555

WORKDIR /btsync

# Arguments: DIR SECRET
ENTRYPOINT ["/bin/bash", "./start.sh"]
