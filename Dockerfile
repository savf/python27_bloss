FROM python:2.7.15-stretch

MAINTAINER Stephan Mannhart

RUN apt-get update && apt-get install -y \
	sudo \
	git \
    python-dev \
    libssl-dev
RUN rm -rf /var/lib/apt/lists/*
COPY solc-0.4.24-amd64.deb /tmp/
RUN apt install -y /tmp/solc-0.4.24-amd64.deb

# Install python packages
COPY requirements.txt /tmp/
RUN pip install --upgrade pip
RUN pip install --requirement /tmp/requirements.txt
