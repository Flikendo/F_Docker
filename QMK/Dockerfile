FROM ubuntu:20.04

RUN apt-get update && \
    apt-get -y install vim && \ 
    apt install -y git python3-pip && \
    apt-get -y install git && \
    apt-get -y install gcc-avr && \
    python3 -m pip install --user qmk && \
    apt-get -y install gcc-arm-none-eabi && \
    apt-get -y install avrdude && \
    apt-get -y install dfu-programmer && \
    apt-get -y install dfu-util

RUN echo 'PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc && . $HOME/.bashrc

CMD ["/bin/bash"]