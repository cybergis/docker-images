# CyberGIS JupyterHub Container

[![docker pulls](https://img.shields.io/docker/pulls/cybergisx/cybergis-jupyterhub.svg)](https://hub.docker.com/r/cybergisx/cybergis-jupyterhub/)
[![docker stars](https://img.shields.io/docker/stars/cybergisx/cybergis-jupyterhub.svg)](https://hub.docker.com/r/cybergisx/cybergis-jupyterhub/)
[![image size](https://img.shields.io/docker/image-size/cybergisx/cybergis-jupyterhub/latest)](https://hub.docker.com/r/cybergisx/cybergis-jupyterhub/ "cybergisx/cybergis-jupyterhub image size")

This docker container is used for the JupyterHub containers on the [CyberGISX](https://cybergisxhub.cigi.illinois.edu/) and [CyberGIS-Jupyter for Water](https://go.illinois.edu/cybergis-jupyter-water/) platforms.

## Notes

When using the upgraded version of the container, you will need to upgrade the Hub's database. BE SURE TO BACKUP ANY AND ALL DATA, ESPECIALLY THE USER DATABASE BEFORE PROCEEDING. To upgrade the database, you can use the following command:

```
cp jupyterhub.sqlite jupyterhub.sqlite_bk  # copy it somewhere safe
docker run -v /xxxxx:/srv/jupyterhub cybergisx/cybergis-jupyterhub:4.0.1 bash -c "jupyterhub upgrade-db"
```

In this command `/xxxx` is the directory which houses the user database file.