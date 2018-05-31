FROM python:2.7.15-slim-stretch

MAINTAINER Stephan Mannhart

RUN apt-get update && apt-get install -y \
	sudo \
	git \
    python-dev \
    libssl-dev
RUN rm -rf /var/lib/apt/lists/*
RUN git clone --recursive https://github.com/ethereum/solidity.git /tmp/solidity
RUN cd /tmp/solidity && git checkout tags/v0.4.21 --quiet
RUN cd /tmp/solidity && git submodule --init --recursive
RUN /tmp/solidity/scripts/install_deps.sh
RUN /tmp/solidity/scripts/build.sh

# Install python packages
COPY requirements.txt /tmp/
RUN pip install --upgrade pip
RUN pip install --requirement /tmp/requirements.txt