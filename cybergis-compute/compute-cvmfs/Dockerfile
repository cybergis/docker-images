# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/compute-cvmfs:0.1.0
# https://hub.docker.com/repository/docker/cybergisx/compute-cvmfs
# Changes:
# * Init release
FROM centos:7

# update and install essentials and lua
RUN yum -y update
RUN yum -y install epel-release && \
  yum repolist
RUN yum -y install bc \
  gcc \
  git \
  tcl-devel \
  Lmod \
  lua \
  lua5.1-bitop \
  lua-json \
  lua-libs \
  lua-lpeg \
  lua-posix \
  lua-term \
  make \
  procps \
  wget \
  which

CMD ["source", "/etc/profile.d/z00_lmod.sh"]