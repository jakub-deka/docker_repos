# This should produce an image of about 9GB
FROM quay.io/jupyter/tensorflow-notebook:cuda-latest

LABEL description="CUDA enabled Tensorflow enviornment"
LABEL version="1.0"

USER root

RUN apt-get update --yes

# Back to the normal user
USER ${NB_UID}
WORKDIR "${HOME}"