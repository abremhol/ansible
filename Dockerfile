FROM ubuntu:noble AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl wget git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo language-pack-en && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS adam
ARG TAGS
RUN addgroup --gid 1001 adam
RUN adduser --gecos adam --uid 1001 --gid 1001 --disabled-password adam
RUN adduser adam sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER adam
WORKDIR /home/adam

FROM adam
COPY . .
RUN sudo chown -R adam:adam /home/adam
ENV USER=adam
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
