FROM ubuntu:20.04

RUN apt-get update && \
    apt-get -y install vim && \ 
    apt install -y git python3-pip && \
    python3 -m pip install --user qmk && \
    echo 'PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc && source $HOME/.bashrc && \
    apt-get -y install gcc-avr

CMD ["/bin/bash"]


qmk compile -kb crkbd -km flik