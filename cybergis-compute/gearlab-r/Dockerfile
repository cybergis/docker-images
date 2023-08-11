# Author: Alexander Michels <michels9@illinois.edu>
# cybergisx/gearlab-r:0.0.1
# https://hub.docker.com/repository/docker/cybergisx/gearlab-r
# Changes:
# * Initial version
FROM r-base:4.3.1

# install package dependencies
RUN R -e "install.packages(c('readxl', 'nonlinearICP', 'CondIndTests', 'bnlearn', 'ISLR', 'tidyr', 'dplyr', 'pracma', 'caret', 'doParallel', 'foreach'))"

#CMD Rscript work/code.R