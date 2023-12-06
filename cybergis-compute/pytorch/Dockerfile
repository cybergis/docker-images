# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/pytorch:0.1.6
# https://hub.docker.com/repository/docker/cybergisx/pytorch
# Changes:
# * working to reduce size of image
FROM nvidia/cuda:11.2.2-base-centos7

ARG GCCVERSION=9.2.0
ARG PYTHONVERSION=3.8.18
ARG PYTORCHVERSION="v1.13.1"
ARG TORCH_CUDA_ARCH_LIST="3.5 7.5"
ARG TORCH_NVCC_FLAGS="-Xfatbin -compress-all"

# KEEP THIS IN SYNC: https://pytorch.org/audio/stable/installation.html#compatibility-matrix
ARG TORCHAUDIOVERSION="0.13.1"
# KEEP THIS IN SYNC: https://github.com/pytorch/vision#installation
ARG TORCHVISIONVERSION="0.14.1"

# Install system dependencies
RUN yum -y groupinstall "Development Tools" && \
        yum install -y \
        bzip2-devel \
        git \
        glib2-devel \
        libffi-devel \
        openssl-devel \
        wget \
        which \
        xz-devel && \
    yum clean all && \
    rm -rf /var/cache/yum/*

# install python3.8
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/$PYTHONVERSION/Python-$PYTHONVERSION.tgz && \
    tar xvf Python-$PYTHONVERSION.tgz && \
    cd Python-$PYTHONVERSION/ && \
    ./configure --enable-optimizations --with-ensurepip=install && \
    make altinstall && \
    ln -fs /usr/local/bin/python3.8 /usr/local/bin/python3 && \
    python3 -m pip install --upgrade cmake && \
    python3 -m pip cache purge && \
    rm -r /tmp/*

# install newer version of GCC (required for pytorch)
RUN cd /tmp && \
    wget ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-$GCCVERSION/gcc-$GCCVERSION.tar.gz && \
    tar -xvzf gcc-$GCCVERSION.tar.gz  && \
    cd gcc-$GCCVERSION  && \
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
    ln -s /usr/local/bin/gcc /usr/local/bin/cc && \
    rm -r /tmp/*

ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:$LD_LIBRARY_PATH

# build pytorch from source
RUN cd /tmp && \
    git clone --recursive https://github.com/pytorch/pytorch.git && \
    cd pytorch && \
    git checkout tags/$PYTORCHVERSION && \
    git submodule sync && git submodule update --init --recursive && \
    python3 -m pip install -r requirements.txt && \
    python3 setup.py install && \
    python3 -m pip cache purge && \
    rm -r /tmp/*

# Install any python packages you need
COPY requirements.txt requirements.txt

RUN python3 -m pip install -r requirements.txt && \
    python3 -m pip install --no-deps torchaudio==$TORCHAUDIOVERSION torchvision==$TORCHVISIONVERSION && \
    python3 -m pip cache purge
