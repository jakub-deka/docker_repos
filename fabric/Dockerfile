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
    unzip

# Install oh my posh because I am a nerd
RUN curl -s https://ohmyposh.dev/install.sh | bash -s
RUN touch ~/.bashrc && echo '\neval "$(oh-my-posh init bash)"' >> ~/.bashrc

WORKDIR "/home"
RUN git clone https://github.com/danielmiessler/fabric.git
WORKDIR "/home/fabric"
RUN pipx install . && pipx ensurepath
RUN touch ~/.bashrc && echo '\nexport PATH="$PATH:/root/.local/bin"' >> ~/.bashrc

RUN curl -fsSL https://ollama.com/install.sh | sh
ADD * /home/
RUN chmod +x /home/get_ollama_model.sh
RUN /home/get_ollama_model.sh

CMD ["/bin/bash"]