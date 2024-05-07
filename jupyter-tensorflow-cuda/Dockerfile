FROM quay.io/jupyter/tensorflow-notebook:cuda-latest

LABEL description="CUDA enabled Tensorflow enviornment"
LABEL version="1.0"

USER root

RUN apt-get update --yes
RUN mkdir /home/$NB_USER/work/cuda_toolkit_download

WORKDIR /home/$NB_USER/work/cuda_toolkit_download
# Download CUDA toolkit and install it
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
RUN sudo dpkg -i cuda-keyring_1.1-1_all.deb
RUN sudo apt-get update
RUN sudo apt-get -y install cuda-toolkit-12-4
RUN sudo apt-get autoremove && sudo apt-get clean
WORKDIR $HOME
RUN rm -rf /home/$NB_USER/work/cuda_toolkit_download
RUN sudo apt-get -y install ncdu
RUN sudo apt-get autoremove && sudo apt-get clean

# Clean up
RUN pip3 cache purge

# Back to the normal user
USER ${NB_UID}
WORKDIR "${HOME}"

# Install additional packages for Python using pip
RUN pip3 install torch torchvision torchaudio
RUN pip3 install tensorflow[and-cuda]
RUN pip3 install transformers
RUN pip3 install polars
RUN pip3 install accelerate
RUN pip3 install flash_attn


# Clean up
RUN pip3 cache purge
