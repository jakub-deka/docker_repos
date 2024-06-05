FROM ubuntu:20.04

ENV TERM xterm-256color
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install python -y
RUN apt-get install git -y
RUN apt-get install pip -y
RUN apt-get install pipx -y
RUN pipx ensurepath

RUN apt-get install curl -y
RUN apt-get install nano -y
RUN apt-get install micro -y
RUN apt-get install unzip -y

# Install oh my posh because I am a nerd
RUN curl -s https://ohmyposh.dev/install.sh | bash -s
RUN touch ~/.bashrc
RUN echo -e '\neval "$(oh-my-posh init bash)"' >> ~/.bashrc


CMD ["/bin/bash"]