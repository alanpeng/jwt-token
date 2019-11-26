FROM ubuntu:16.04

COPY ./requirement.txt /root/
COPY ./Makefile /root/
COPY ./main.py /root/

RUN apt-get update && \
    apt-get install -y python3 python3-pip build-essential libssl-dev libffi-dev python-dev && \
    pip3 install -r /root/requirement.txt && \
    pip3 install pyinstaller && \
    mkdir /root/bin && \
    cd /root && \
    make && \
    make clean && \
    rm -rf /root/*

WORKDIR /root/
