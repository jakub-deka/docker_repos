FROM quay.io/jupyter/tensorflow-notebook:cuda-latest

LABEL description="CUDA enabled Tensorflow enviornment"
LABEL version="1.0"

USER root

RUN apt-get update
RUN mkdir /home/$NB_USER/work/jaks_test_dir

USER $NB_UID

WORKDIR $HOME