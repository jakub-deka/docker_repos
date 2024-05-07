FROM quay.io/jupyter/tensorflow-notebook:cuda-latest

LABEL description="CUDA enabled Tensorflow enviornment"
LABEL version="1.0"

# Back to the normal user
USER ${NB_UID}
WORKDIR "${HOME}"

# Install additional packages for Python using pip
# RUN pip3 install torch torchvision torchaudio
RUN pip3 install tensorflow[and-cuda]
# RUN pip3 install transformers
# RUN pip3 install polars
# RUN pip3 install accelerate
# RUN pip3 install flash_attn


# Clean up
RUN pip3 cache purge
