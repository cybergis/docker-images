# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/cybergis-jupyterhub:5.2.1
# https://hub.docker.com/repository/docker/cybergisx/cybergis-jupyterhub
# Changes:
# * Upgraded to JupyterHub 5.2.1
FROM quay.io/jupyterhub/jupyterhub:5.2.1

EXPOSE 8081

RUN apt update && apt upgrade -y && apt install -y netcat iputils-ping nano openssh-client git

RUN python3 -m pip install --quiet git+https://github.com/cybergis/oauthenticator.git@839c0c3adc8add7b4cc0b1c0609bdc0e7dea7095

RUN python3 -m pip install --quiet git+https://github.com/cybergis/dockerspawner.git@8c1ea76de461504f8043fabd7b42a67480c7ac73

RUN python3 -m pip install --quiet jupyterhub-dummyauthenticator

# Update certs
# see: https://discourse.jupyter.org/t/letsencrypt-certificate-verification-failed-after-09-30-2021/11058
RUN apt-get update && apt-get install -yq --no-install-recommends \
    ca-certificates \
    libgnutls30 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
