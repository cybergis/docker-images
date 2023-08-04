# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/cjw:0.1.6
# https://hub.docker.com/repository/docker/cybergisx/cjw
# JupyterLab version: 3.2.6
# JupyterHub version: 2.0.2
# Changes:
# * added stickyland
FROM jupyter/minimal-notebook:2022-01-12

USER root

RUN apt-get update && apt-get install --fix-missing -y --no-install-recommends \
    aria2 \
    autoconf \
    automake \
    bash \
    bash-completion \
    bc \
    build-essential \
    bzip2 \
    ca-certificates \
    csh \
    cm-super \
    cmake \
    curl \
    dvipng \
    ffmpeg \
    g++ \
    gcc \
    gfortran \
    git \
    grep \
    htop \
    iputils-ping \
    less \
    libbsd-dev \
    libhdf5-dev \
    libibverbs-dev \
    liblua5.3-0:amd64 \
    liblua5.3-dev:amd64 \
    libswitch-perl \
    libtcl8.6:amd64 \
    libtool \
    lsb-release \
    lua-bit32:amd64 \
    lua-posix-dev \
    lua-posix:amd64 \
    lua5.3 \
    m4 \
    make \
    nano \
    netcat \
    openssh-client \
    rsync \
    screen \
    sed \
    software-properties-common \
    tcl \
    tcl-dev \
    tcl8.6 \
    tcl8.6-dev:amd64 \
    unzip \
    valgrind \
    vim \
    wget \
    zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

RUN update-alternatives --config csh

# installing lmod
RUN update-alternatives --install /usr/bin/lua \
    lua-interpreter /usr/bin/lua5.3 130 \
    --slave /usr/share/man/man1/lua.1.gz lua-manual \
    /usr/share/man/man1/lua5.3.1.gz
RUN update-alternatives --install /usr/bin/luac \
    lua-compiler /usr/bin/luac5.3 130 \
    --slave /usr/share/man/man1/luac.1.gz lua-compiler-manual \
    /usr/share/man/man1/luac5.3.1.gz
RUN ln -sf /usr/lib/x86_64-linux-gnu/liblua5.3-posix.so \
    /usr/lib/x86_64-linux-gnu/lua/5.3/posix.so

RUN cd /tmp && \
    git clone https://github.com/TACC/Lmod && \
    cd Lmod && \
    ./configure --prefix=/usr/share && \
    make install && \
    rm -rf /tmp/Lmod

RUN ln -s /usr/share/lmod/lmod/init/profile        /etc/profile.d/z00_lmod.sh && \
    ln -s /usr/share/lmod/lmod/init/cshrc          /etc/profile.d/z00_lmod.csh && \
    /bin/bash -c "source /etc/profile.d/z00_lmod.sh"

RUN mkdir -p /home/docker && chmod -R 777 /home/docker
RUN mkdir /cjw-labext && chmod -R 777 /cjw-labext

USER jovyan
# this is from scipy-notebook
WORKDIR /tmp
RUN git clone https://github.com/PAIR-code/facets.git && \
    jupyter nbextension install facets/facets-dist/ --sys-prefix && \
    rm -rf /tmp/facets && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}" && \
    conda config --set auto_activate_base false

# Import matplotlib the first time to build the font cache.
ENV XDG_CONFIG_HOME=/home/jovyan/work/.config
ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/"
RUN pip install matplotlib && \
    MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix-permissions "/home/${NB_USER}"

RUN mamba install -y -c conda-forge \
    ipyleaflet==0.16.0 \
    ipympl \
    jupyter_contrib_nbextensions \
    jupyterlab_code_formatter \
    jupyterlab-git==0.34.1 \
    jupyterthemes \
    rise \
    nodejs

RUN pip install autopep8 black click flake8 hs_restclient ipython-sql nbgitpuller nbsphinx pycodestyle_magic stickyland && \
    pip install --quiet git+https://github.com/cybergis/nbgitpuller.git@59dfe19f6f4996d678238078db5605de9896c309 && \
    pip install --quiet git+https://github.com/Castronova/jupyter_contrib_nbextensions.git@15a772ef5510693f7fa0de8ae0e27a670ff77e35 &&\
    pip install git+https://github.com/cybergis/Jupyter-xsede.git@3e0ed5dd042a62f19a3fc8a3fe33cea38d46f21f && \
    wget -O /opt/conda/lib/python3.9/site-packages/jupyterlab_git/git.py https://raw.githubusercontent.com/cybergis/jupyterlab-git/93a90131cdecfa32f392e4a2727bd58501dd5f9a/jupyterlab_git/git.py && \
    # temporary fix for nbgitpuller issue: https://github.com/jupyterhub/nbgitpuller/issues/235
    cp /opt/conda/lib/python3.9/site-packages/nbgitpuller/templates/* /opt/conda/lib/python3.9/site-packages/notebook/templates && \
    jupyter serverextension enable nbgitpuller --sys-prefix && \
    jupyter nbextension enable init_cell/main --sys-prefix && \
    jupyter nbextension enable --py ipyleaflet --sys-prefix && \
    jupyter nbextension enable python-markdown/main --sys-prefix && \
    jupyter nbextension enable --py widgetsnbextension && \
    jupyter labextension install jupyterlab-launcher-shortcuts && \
    jupyter contrib nbextension install --user && \
    jupyter nbextension enable recursivedelete/main --user --section=tree && \
    jupyter nbextensions_configurator disable --user
# required for hydroshare_on_jupyter
RUN python3 -m pip install pydantic==1.9.1 hydroshare_on_jupyter==0.1.5 && \
    python3 -m hydroshare_on_jupyter configure
ENV OAUTH="/home/jovyan/work/.hs_auth2"
ENV DATA="/home/jovyan/work/Downloads"

RUN python -m pip install --upgrade pip && pip --version && pip cache purge

# for Nathan's extension
RUN cd /cjw-labext && git clone https://github.com/cybergis/cigi_notification && \
    cd cigi_notification && pip install -e . && \
    jupyter labextension develop . --overwrite && \
    jlpm build
RUN cd /cjw-labext && git clone https://github.com/cybergis/lab_bug_report_button && \
    cd lab_bug_report_button && pip install -e . && \
    jupyter labextension develop . --overwrite && \
    jlpm build

WORKDIR "${HOME}"
