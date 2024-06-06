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
    xsel

# Install oh my posh because I am a nerd
RUN curl -s https://ohmyposh.dev/install.sh | bash -s
RUN touch ~/.bashrc && echo 'eval "$(oh-my-posh init bash)"' >> ~/.bashrc

WORKDIR "/home"
RUN git clone https://github.com/danielmiessler/fabric.git
WORKDIR "/home/fabric"
RUN pipx install . && pipx ensurepath
RUN touch ~/.bashrc && echo 'export PATH="$PATH:/root/.local/bin"' >> ~/.bashrc
RUN echo "alias pbcopy='xsel --input --clipboard'" >> ~/.bashrc
RUN echo "alias pbpaste='xsel --output --clipboard'" >> ~/.bashrc
RUN echo "alias fab='fabric -m llama3:latest --remoteOllamaServer host.docker.internal::11667'"

WORKDIR "/home"

ADD ./fabric_host_startup.sh //tmp/
RUN chmod +x //tmp/fabric_host_startup.sh

CMD ["/tmp/fabric_host_startup.sh"]
