FROM langroid/langroid:latest

RUN apt-get update && apt-get install -y \
    nano \
    micro \
    unzip \
    ffmpeg \
    file

WORKDIR "/home"
RUN git clone https://github.com/danielmiessler/fabric.git
WORKDIR "/home/fabric"
RUN pipx install . && pipx ensurepath
RUN touch ~/.bashrc && echo 'export PATH="$PATH:/root/.local/bin"' >> ~/.bashrc
RUN echo "alias fab='fabric -m llama3:latest --remoteOllamaServer host.docker.internal:11669'" >> ~/.bashrc

# Install oh my posh because I am a nerd
RUN curl -s https://ohmyposh.dev/install.sh | bash -s
RUN touch ~/.bashrc && echo 'eval "$(oh-my-posh init bash)"' >> ~/.bashrc
RUN echo 'eval "$(oh-my-posh init bash --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/stelbent-compact.minimal.omp.json)"' >> ~/.bashrc

WORKDIR "/home"

CMD ["/bin/bash"]