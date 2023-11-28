# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/pytorch:0.1.0
# https://hub.docker.com/repository/docker/cybergisx/pytorch
# Notes:
# * Based on this blog post: https://saturncloud.io/blog/how-to-install-pytorch-on-the-gpu-with-docker/
# Changes:
# * Init release
FROM nvidia/cuda:11.6.1-base-ubuntu20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        python3-pip \
        python3-dev \
        python3-opencv \
        libglib2.0-0
# Install any python packages you need
COPY requirements.txt requirements.txt

# Upgrade pip
RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install -r requirements.txt

# Install PyTorch and torchvision
RUN pip3 install torch torchvision torchaudio -f https://download.pytorch.org/whl/cu111/torch_stable.html

# # Set the working directory
# WORKDIR /app

# # Set the entrypoint
# ENTRYPOINT [ "python3" ]