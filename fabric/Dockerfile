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

WORKDIR "/home"
RUN git clone https://github.com/danielmiessler/fabric.git
WORKDIR "/home/fabric"
RUN pipx install . && pipx ensurepath
RUN touch ~/.bashrc && echo 'export PATH="$PATH:/root/.local/bin"' >> ~/.bashrc
RUN echo "alias pbcopy='xsel --input --clipboard'" >> ~/.bashrc
RUN echo "alias pbpaste='xsel --output --clipboard'" >> ~/.bashrc
RUN echo "alias fab='fabric -m llama3:latest --remoteOllamaServer host.docker.internal:11667'" >> ~/.bashrc
RUN echo "alias fab_llama='fabric -m llama3:latest --remoteOllamaServer host.docker.internal:11667'" >> ~/.bashrc
RUN echo "alias fab_phi3='fabric -m phi3:latest --remoteOllamaServer host.docker.internal:11667'" >> ~/.bashrc
RUN echo "alias fab_mistral='fabric -m mistral:latest --remoteOllamaServer host.docker.internal:11667'" >> ~/.bashrc
RUN echo "alias fab_dolphin='fabric -m dolphin-mistral:latest --remoteOllamaServer host.docker.internal:11667'" >> ~/.bashrc
RUN echo "alias fab_gemma='fabric -m gemma:2b --remoteOllamaServer host.docker.internal:11667'" >> ~/.bashrc



# Install oh my posh because I am a nerd
RUN curl -s https://ohmyposh.dev/install.sh | bash -s
RUN touch ~/.bashrc && echo 'eval "$(oh-my-posh init bash)"' >> ~/.bashrc
RUN echo 'eval "$(oh-my-posh init bash --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/stelbent-compact.minimal.omp.json)"' >> ~/.bashrc

WORKDIR "/home"

CMD ["/bin/bash"]
