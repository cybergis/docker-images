# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/pytorch:0.1.4
# https://hub.docker.com/repository/docker/cybergisx/pytorch
# Notes:
# * Based on this blog post: https://saturncloud.io/blog/how-to-install-pytorch-on-the-gpu-with-docker/
# Changes:
# * building torch from source, requires python >=3.8
FROM nvidia/cuda:11.2.2-base-centos7

ARG PYTHONVERSION=3.8.18

ENV TORCH_CUDA_ARCH_LIST="3.5"

# Install system dependencies
RUN yum -y groupinstall "Development Tools"
RUN yum install -y \
        bzip2-devel \
        git \
        glib2-devel \
        libffi-devel \
        openssl-devel \
        wget \
        xz-devel

# install python3.8
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/$PYTHONVERSION/Python-$PYTHONVERSION.tgz && \
    tar xvf Python-$PYTHONVERSION.tgz && \
    cd Python-$PYTHONVERSION/ && \
    ./configure --enable-optimizations && \
    make altinstall && \
    ln -fs /usr/local/bin/python3.8 /usr/local/bin/python3

# Install pip
RUN cd /tmp && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py

# install newer version of GCC (required for pytorch)
RUN wget ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-7.2.0/gcc-7.2.0.tar.gz && \
    tar -xvzf gcc-7.2.0.tar.gz  && \
    cd gcc-7.2.0  && \
    ./contrib/download_prerequisites  && \
    ./configure \
        --enable-bootstrap \
        --enable-languages=c,c++,fortran,lto \
        --with-bugurl=http://bugzilla.redhat.com/bugzilla \
        --enable-shared \
        --enable-threads=posix \
        --enable-checking=release \
        --disable-multilib \
        --with-system-zlib \
        --enable-__cxa_atexit \
        --disable-libunwind-exceptions \
        --enable-gnu-unique-object \
        --enable-linker-build-id \
        --with-gcc-major-version-only \
        --enable-plugin \
        --with-linker-hash-style=gnu \
        --enable-initfini-array \
        --enable-libmpx \
        --enable-gnu-indirect-function \
        --with-tune=generic \
        --build=x86_64-redhat-linux && \
    make -j4 && \
    make install && \
    sh -c 'echo /usr/local/lib > /etc/ld.so.conf.d/1-gcc.conf' && \
    sh -c 'echo /usr/local/lib64 >> /etc/ld.so.conf.d/1-gcc.conf' && \
    ln -s /usr/local/bin/gcc /usr/local/bin/cc

# install cmake >=3.18 for Pytorch
RUN cd /tmp && \
    wget https://github.com/Kitware/CMake/releases/download/v3.28.0-rc5/cmake-3.28.0-rc5.tar.gz && \
    tar zxvf cmake-3.* && \
    cd cmake-3.28.0-rc5 && \
    ./bootstrap --prefix=/usr/local && \
    make -j$(nproc) && \
    make install

# build pytorch, vision, and audio from source
RUN cd /tmp && \
    git clone --recursive https://github.com/pytorch/pytorch.git && \
    cd pytorch && \
    pip install -r requirements.txt && \
    python3 setup.py install
RUN cd /tmp && \
    git clone --recursive https://github.com/pytorch/vision.git && \
    cd vision && \
    pip install -r requirements.txt && \
    python3 setup.py install
RUN cd /tmp && \
    git clone --recursive https://github.com/pytorch/audio.git && \
    cd vision && \
    pip install -r requirements.txt && \
    python3 setup.py install

# Install any python packages you need
COPY requirements.txt requirements.txt

RUN python3 -m pip install -r requirements.txt
