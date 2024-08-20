FROM ubuntu:focal
ARG TAGS
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt-add-repository -y ppa:neovim-ppa/unstable && apt update && apt install -y curl git ansible build-essential neovim sudo
RUN adduser --disabled-password --gecos "bob" corni && usermod -aG sudo corni
WORKDIR /home/corni/
COPY . .
RUN chown -R corni:corni .
#CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
