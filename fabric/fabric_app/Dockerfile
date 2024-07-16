FROM ubuntu:latest

ENV TERM xterm-256color
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    git \
    python3 \
    python-is-python3 \
    pip \
    pipx \
    curl \
    nano \
    micro \
    unzip \
    ffmpeg \
    xsel \
    nodejs \
    npm

RUN apt-get install -y \
    file \
    lynx

WORKDIR "/home"
RUN git clone https://github.com/danielmiessler/fabric.git
WORKDIR "/home/fabric"
RUN pipx install . && pipx ensurepath
RUN touch ~/.bashrc
ADD aliases /home/fabric/aliases
RUN cat /home/fabric/aliases >> ~/.bashrc

# Install oh my posh because I am a nerd
RUN curl -s https://ohmyposh.dev/install.sh | bash -s
RUN touch ~/.bashrc && echo 'eval "$(oh-my-posh init bash)"' >> ~/.bashrc
RUN echo 'eval "$(oh-my-posh init bash --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/stelbent-compact.minimal.omp.json)"' >> ~/.bashrc

WORKDIR "/home"

CMD ["tail", "-f", "//dev/null"]
