FROM ubuntu:20.04

RUN apt-get update && \
    apt-get -y install vim && \ 
    apt install -y git python3-pip && \
    apt-get -y install git && \
    python3 -m pip install --user qmk

RUN echo 'PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc && . $HOME/.bashrc

CMD ["/bin/bash"]