FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN echo '---------------- Updating OS... ----------------' && \
    apt-get update && \
    echo '---------------- Upgrading OS... ----------------' && \
    apt-get -y upgrade && \
    echo '---------------- Installing tools... ----------------' && \
    apt-get -y install vim && \
    apt-get -y install wget && \
    apt-get -y install dpkg && \
    apt-get -y install x11-common

# Autokey-gtk
RUN echo '---------------- Installing Autokey-gtk... ----------------' && \
    apt-get -y install autokey-gtk
    
CMD ["/bin/bash"]