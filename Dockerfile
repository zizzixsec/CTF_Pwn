# ZizzixSec CTF PWN Dockerfile
FROM archlinux:latest
LABEL maintainer="Rachel Snyder <zizzixsec@gmail.com>"

ARG TZ="America/Chicago"
ARG LANG="en_US.UTF-8"

ENV SHELL "/bin/bash"
ENV HOME "/root"
ENV EDITOR "vim"
ENV PATH "$PATH:/usr/lib/python3.11/site-packages/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/bin"
ENV DEBUGINFOD_URLS "https://debuginfod.elfutils.org/"
ENV PIP_BREAK_SYSTEM_PACKAGES 1

RUN ln -svf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    sed -i "s/^#${LANG}/${LANG}/g" /etc/locale.gen && \
    locale-gen && echo "LANG=${LANG}" > /etc/locale.conf

RUN pacman-key --init && pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
    base-devel git gdb wget patchelf elfutils file strace ltrace tmux \
    python python-pip gnu-netcat ruby vim checksec xclip lib32-glibc nasm

WORKDIR ${HOME}

RUN git clone --depth 1 https://github.com/pwndbg/pwndbg pwndbg && \
    cd pwndbg && chmod +x setup.sh && ./setup.sh

RUN mkdir -pv bin && cd bin && \
    wget https://github.com/io12/pwninit/releases/download/3.3.0/pwninit && \
    chmod +x pwninit

RUN git clone https://github.com/radareorg/radare2 && radare2/sys/install.sh

RUN pip install --no-cache-dir \
    -U pip ropper angr IPython pwn && \
    gem install one_gadget seccomp-tools && \
    rm -rf .local/share/gem/ruby/3.0.0/cache/*

COPY home/.vimrc .vimrc
COPY home/.gdbinit .gdbinit
COPY home/.bash_profile .bash_profile
COPY home/.bashrc .bashrc
COPY home/.tmux.conf .tmux.conf

WORKDIR /chal
CMD bash