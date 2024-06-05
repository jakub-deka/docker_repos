FROM ubuntu:20.04

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install python -y
RUN apt-get install git -y
RUN apt-get install pip -y
RUN apt-get install pipx -y
RUN pipx ensurepath

CMD ["/bin/bash"]