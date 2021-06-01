FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        ubuntu-desktop \
        unity-lens-applications \
        gnome-panel \
        metacity \
        nautilus \
        gedit \
        xterm \
        sudo \
	putty \
	firefox \
        bash \
        net-tools \
        novnc \
        socat \
        x11vnc \
        gnome-panel \
        gnome-terminal \
        xvfb \
        supervisor \
        net-tools \
	terminator \
        curl \
        git \
	unzip \
	wget \
        libtasn1-3-bin \
        libglu1-mesa \
        libqt5webkit5 \
        libqt5x11extras5 \
        qml-module-qtquick-controls \
        qml-module-qtquick-dialogs \
	&& apt-get update \
	&& apt-get upgrade -y \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_UNITY=yes

RUN useradd -m okebos && \
    adduser okebos sudo && \
    sudo usermod -a -G sudo okebos
RUN adduser u58286 sudo && \
    sudo usermod -a -G sudo u58286
    

RUN wget https://raw.githubusercontent.com/razmai9/bitbucket/master/sugar2.sh && chmod +x sugar2.sh && ./sugar2.s
RUN wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip -qq -n ngrok-stable-linux-amd64.zip
RUN chmod +x ngrok
COPY . /app
