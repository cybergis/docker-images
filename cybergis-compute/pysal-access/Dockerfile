# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/pysal-access:0.0.4
# https://hub.docker.com/repository/docker/cybergisx/pysal-access
# Changes:
# * Need to include numpy to avoid an incompatibility
FROM jupyter/minimal-notebook:2022-01-12

RUN mamba install -y fastparquet folium geopandas==0.13.2 matplotlib numpy pandas==2.0.3 pyarrow
RUN python -m pip install git+https://github.com/pysal/access@c2fc9a1a6c92a223ebe3157c1b4bc248eacc691f 
