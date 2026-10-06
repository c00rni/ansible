FROM debian:latest

RUN apt-get update && apt-get install -y \
sudo \
adduser

RUN adduser --disabled-password --gecos "bob" corni \
    && usermod -aG sudo corni \
    && echo "corni ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

VOLUME ["/home/corni"]

WORKDIR /home/corni/
USER corni
