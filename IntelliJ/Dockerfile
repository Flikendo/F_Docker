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

# Java
RUN echo '---------------- Installing Java... ----------------' && \
    apt-get -y install openjdk-17-jdk 
    
ENV JAVA_HOME /opt/jdk17
ENV PATH $PATH:$JAVA_HOME/bin

# IntelliJ part
RUN echo '---------------- Installing IntelliJ... ----------------' && \
    apt-get -y install snapd && \
    snap install intellij-idea-community --classic 
    
CMD ["/bin/bash"]