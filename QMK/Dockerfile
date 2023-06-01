FROM ubuntu:20.04

RUN apt-get update && \
    apt-get -y install vim && \ 
    apt install -y git python3-pip && \
    apt-get -y install git && \
    python3 -m pip install --user qmk && \
    apt-get -y install gcc-avr && \
    apt-get -y install arm-none-eabi-gcc && \
    apt-get -y install avrdude && \
    apt-get -y install dfu-programmer && \
    apt-get -y install dfu-util

RUN echo 'PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc && . $HOME/.bashrc

CMD ["/bin/bash"]