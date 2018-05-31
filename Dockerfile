FROM python:2.7

MAINTAINER Stephan Mannhart

RUN add-apt-repository ppa:ethereum/ethereum -y
RUN apt-get update && apt-get install -y \
    python-dev \
    solc \
    libssl-dev
RUN rm -rf /var/lib/apt/lists/*

# Install python packages
COPY requirements.txt /tmp/
RUN pip install --upgrade pip
RUN pip install --requirement /tmp/requirements.txt
