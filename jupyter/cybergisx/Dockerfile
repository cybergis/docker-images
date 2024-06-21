# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/cybergisx-dev:0.1.17
# https://hub.docker.com/repository/docker/cybergisx/cybergisx-dev
# JupyterLab version: 4.0.3
# JupyterHub version: 2.7.0
# Changes:
# * Testing voila
# * updated base image
FROM quay.io/jupyter/minimal-notebook:2024-06-17

USER root

RUN apt-get update && apt-get install --fix-missing -y --no-install-recommends \
    apt-transport-https \
    aria2 \
    awscli \
    autoconf \
    automake \
    bash \
    bash-completion \
    bc \
    bliss \
    build-essential \
    bzip2 \
    ca-certificates \
    cmake \
    cm-super \
    curl \
    dvipng \
    ffmpeg \
    g++ \
    gcc \
    gfortran \
    git \
    glpk-utils \
    gnutls-bin \
    grep \
    iputils-ping \
    less \
    libffi-dev \
    libibverbs-dev \
    liblua5.3-0 \
    liblua5.3-dev \
    libpq-dev \
    libpqxx-dev \
    libsqlite3-dev \
    libssl-dev \
    libswitch-perl \
    libtcl8.6 \
    libtool \
    lsb-release \
    lua-posix \
    lua-posix-dev \
    lua5.3 \
    m4 \
    make \
    nano \
    nco \
    netcat \
    net-tools \
    openssh-client \
    openssl \
    rsync \
    screen \
    sed \
    subversion \
    tcsh \
    tcl \
    tcl-dev \
    tcl8.6 \
    tcl8.6-dev \
    ttf-mscorefonts-installer \
    unzip \
    valgrind \
    vim \
    wget \
    wkhtmltopdf \
    xorg \
    # zimpl \
    zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

RUN update-alternatives --config csh

# installing Lmod
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
    cd / && \
    rm -rf /tmp/Lmod

RUN ln -s /usr/share/lmod/lmod/init/profile        /etc/profile.d/z00_lmod.sh && \
    ln -s /usr/share/lmod/lmod/init/cshrc          /etc/profile.d/z00_lmod.csh && \
    /bin/bash -c "source /etc/profile.d/z00_lmod.sh"

USER jovyan
# this is from scipy-notebook
# Install Python 3 packages
# some of these packages are from us, mixed into minimize layers
RUN mamba install --yes \
    'altair' \
    'beautifulsoup4' \
    'bokeh' \
    'bottleneck' \
    'cloudpickle' \
    'conda-forge::blas=*=openblas' \
    'cython' \
    'dask' \
    'dill' \
    'h5py' \
    'ipyleaflet' \
    'ipympl'\
    'ipywidgets' \
    # 'jupyter-collaboration' \
    'jupyter_contrib_nbextensions' \
    'jupyterlab_code_formatter' \
    'jupyterlab-git' \
    'jupyterlab-sos' \
    'jupyterthemes' \
    'matplotlib-base' \
    'nodejs' \
    'notebook' \
    'numba' \
    'numexpr' \
    'openpyxl' \
    'pandas' \
    'patsy' \
    'protobuf' \
    'pytables' \
    'rise' \
    'scikit-image' \
    'scikit-learn' \
    'scipy' \
    'seaborn' \
    'sqlalchemy' \
    'statsmodels' \
    'sympy' \
    'widgetsnbextension'\
    'xlrd' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

WORKDIR /tmp
RUN git clone https://github.com/PAIR-code/facets && \
    jupyter nbclassic-extension install facets/facets-dist/ --sys-prefix && \
    rm -rf /tmp/facets && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Import matplotlib the first time to build the font cache.
RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix-permissions "/home/${NB_USER}"

RUN pip install autopep8 black cybergis-compute-client flake8 ipython-sql jupyterlab_rise nbgitpuller nbsphinx pycodestyle_magic stickyland voila
# RUN pip install git+https://github.com/jupyterlab/jupyter-collaboration.git@7bd86d17b476daf68d49016db525054b324978ba
RUN jupyter serverextension enable nbgitpuller --sys-prefix && \
    jupyter nbextension enable init_cell/main --sys-prefix && \
    # jupyter nbextension enable --py ipyleaflet --sys-prefix && \
    jupyter nbextension enable python-markdown/main --sys-prefix && \
    jupyter serverextension enable voila && \
    jupyter server extension enable voila && \
    jupyter nbextension list
RUN python -m pip install --upgrade pip && pip --version && pip cache purge

WORKDIR "${HOME}"
# we want to use sh so we can source our stuff
CMD ["start-notebook.sh"]