FROM python:2.7

MAINTAINER Stephan Mannhart

RUN apt-get update && apt-get install -y \
    python-dev
RUN rm -rf /var/lib/apt/lists/*

# Install python packages
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
