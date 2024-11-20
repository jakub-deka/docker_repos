FROM python:3

ENV TERM=linux
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install neofetch curl wget nano micro git -y
RUN apt install fish -y

CMD ["/bin/bash"]