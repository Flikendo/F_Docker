FROM ubuntu:20.04

RUN apt-get update && \
    apt-get -y install vim && \ 
    apt install -y git python3-pip && \
    apt-get -y install git && \
    python3 -m pip install --user qmk && \
    mkdir QMK_files && \
    cp buildKeymap.sh QMK_files && \
    cp config.h QMK_files && \
    cp crkbd_revc1_flik.hex QMK_files && \
    cp glcdfont.c QMK_files && \
    cp keymap.c QMK_files && \
    cp rules.mk QMK_files

RUN echo 'PATH="$HOME/.local/bin:$PATH"' >> $HOME/.bashrc && . $HOME/.bashrc

CMD ["/bin/bash"]