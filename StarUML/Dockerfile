FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN echo '---------------- Updating OS... ----------------' && \
    apt-get update && \
    echo '---------------- Upgrading OS... ----------------' && \
    apt-get -y upgrade && \
    echo '---------------- Installing tools... ----------------' && \
    apt-get -y install vim && \
    apt-get -y install git && \
    apt-get -y install wget && \
    apt-get -y install dpkg && \
    apt-get -y install x11-common

# StartUML part
RUN echo '---------------- Installing StartUML... ----------------' && \
    wget https://staruml.io/download/releases-v5/StarUML_5.0.1_amd64.deb
    #dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb && \
    #dpkg -i StartUML-v2.7.0-64-bit.deb && \
    apt -y install StarUML_5.0.1_amd64.deb
    
CMD ["/bin/bash"]