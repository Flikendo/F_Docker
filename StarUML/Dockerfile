FROM ubuntu:20.04

RUN apt-get update && \
    echo 'Installing tools...' && \
    apt-get -y install vim && \
    apt-get -y install git && \
    apt-get -y install wget && \
    apt-get -y install dpkg && \
# Java
    echo 'Installing Java...' && \
    apt-get -y install openjdk-17-jdk && \
ENV JAVA_HOME /opt/jdk17
ENV PATH $PATH:$JAVA_HOME/bin
# StartUML part
RUN echo 'Installing StartUML...' && \
    apt-get -y dpkg && \
    dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb && \
    dpkg -i StartUML-v2.7.0-64-bit.deb && \   
# IntelliJ part
    echo 'Installing IntelliJ...' && \
    apt-get -y install snapd && \
    snap install intellij-idea-community --classic 
    
CMD ["/bin/bash"]