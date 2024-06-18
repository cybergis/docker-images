# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/pytorch:0.1.13-conda
# https://hub.docker.com/repository/docker/cybergisx/pytorch
# Changes:
# * compiling openssl to /usr so it works
FROM nvidia/cuda:11.3.1-cudnn8-devel-centos7

ARG CUDA_VERSION=11.3
ARG GCCVERSION=9.2.0
ARG PYTHONVERSION=3.9.18

# Install system dependencies
RUN yum -y groupinstall "Development Tools" && \
        yum install -y \
        bzip2-devel \
        git \
        glib2-devel \
        libffi-devel \
	libjpeg-turbo-devel \
        libpng-devel \
        perl-core \
        pcre-devel \
        wget \
        which \
        xz-devel \
        zlib-devel && \
    yum clean all && \
    rm -rf /var/cache/yum/*

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

# install openssl 
RUN cd /tmp && \
    curl https://ftp.openssl.org/source/old/1.1.1/openssl-1.1.1j.tar.gz --output openssl.tar.gz  && \
    tar xzf openssl.tar.gz && \
    cd openssl-1.1.1j/ && \
    ./config --prefix=/usr --openssldir=/etc/ssl --libdir=lib no-shared zlib-dynamic && \
    make && make install && \
    openssl version && \
    rm -r /tmp/*

# install python3.9
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/$PYTHONVERSION/Python-$PYTHONVERSION.tgz && \
    tar xvf Python-$PYTHONVERSION.tgz && \
    cd Python-$PYTHONVERSION/ && \
    ./configure --enable-optimizations --with-ensurepip=install && \
    make altinstall && \
    ln -fs /usr/local/bin/python3.9 /usr/local/bin/python3 && \
    python3 -m pip install --upgrade cmake && \
    python3 -m pip cache purge && \
    rm -r /tmp/*

ENV CUDA_HOME="/usr/local/cuda"
ENV PATH="${CUDA_HOME}:${PATH}"
ENV PYTHONNOUSERSITE=True

RUN cd /tmp && curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" && \
    bash Miniforge3-$(uname)-$(uname -m).sh && \
    mamba --version && \
    mamba create --name env python=3.9

RUN mamba activate env && \
    mamba install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch && \
    python -c "import torch; print(torch.cuda.get_arch_list())"


RUN python3 -c "import torch; print(torch.__version__)" && \
    python3 -c "import torchvision; print(torchvision.__version__)" && \
    python3 -c "import torchaudio; print(torchaudio.__version__)" && \
    python3 -c "import torchgeo; print(torchgeo.__version__)"

