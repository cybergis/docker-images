# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/pytorch:0.1.3
# https://hub.docker.com/repository/docker/cybergisx/pytorch
# Notes:
# * Based on this blog post: https://saturncloud.io/blog/how-to-install-pytorch-on-the-gpu-with-docker/
# Changes:
# * Added TORCH_CUDA_ARCH_LIST to make it compatible with Keeling GPUs
FROM nvidia/cuda:11.2.2-base-centos7

# Install system dependencies
RUN yum install -y \
        git \
        python3-pip \
        python3 \
        python3-opencv \
        glib2-devel

# Install any python packages you need
COPY requirements.txt requirements.txt

# Upgrade pip
RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install -r requirements.txt

# Install PyTorch and torchvision
RUN TORCH_CUDA_ARCH_LIST=3.5 pip3 install torch==1.10.0+cu111 torchvision==0.11.0+cu111 torchaudio==0.10.0 -f https://download.pytorch.org/whl/torch_stable.html

# # Set the working directory
# WORKDIR /app

# # Set the entrypoint
# ENTRYPOINT [ "python3" ]