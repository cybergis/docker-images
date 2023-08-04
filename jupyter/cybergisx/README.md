# CyberGISX/CyberGIS-Jupyter Container

[![docker pulls](https://img.shields.io/docker/pulls/cybergisx/cybergisx.svg)](https://hub.docker.com/r/cybergisx/cybergisx/)
[![docker stars](https://img.shields.io/docker/stars/cybergisx/cybergisx.svg)](https://hub.docker.com/r/cybergisx/cybergisx/)
[![image size](https://img.shields.io/docker/image-size/cybergisx/cybergisx/latest)](https://hub.docker.com/r/cybergisx/cybergisx/ "cybergisx/cybergisx image size")

This docker container is used for the user containers on the [CyberGISX](https://cybergisxhub.cigi.illinois.edu/) platform.

## Notes

When using the upgraded version of the container, you will need to upgrade the Hub's database. BE SURE TO BACKUP ANY AND ALL DATA, ESPECIALLY THE USER DATABASE BEFORE PROCEEDING. To upgrade the database, you can use the following command:

```
cp jupyterhub.sqlite jupyterhub.sqlite_bk  # copy it somewhere safe
docker run -v /xxxxx:/srv/jupyterhub cybergisx/cybergisx:4.0.1 bash -c "jupyterhub upgrade-db"
```

In this command `/xxxx` is the directory which houses the user database file.