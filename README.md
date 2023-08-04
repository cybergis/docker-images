# CyberGIS Center Docker Images

This is designed to be a central repository for docker images used by the CyberGIS Center. Check out our page on [Docker Hub](https://hub.docker.com/u/cybergisx).

Catgories:

* [cybergis-compute](cybergis-compute/) - Docker images created for the [CyberGIS-Compute](https://cybergis.github.io/cybergis-compute-python-sdk/index.html) project. Note that not all images used in CyberGIS-Compute are hosted in this repo, please check the [`/container` route](https://cgjobsup.cigi.illinois.edu/v2/container) for details on specific images.
* [jupyter](jupyter/) - Docker images created for the Jupyter-based science gateways we support including [CyberGISX](https://cybergisxhub.cigi.illinois.edu/) and [CyberGIS-Jupyter for Water](https://go.illinois.edu/cybergis-jupyter-water/)

## Documentation Recommendations

To keep this repository clean, organized and well-documented, please:

1. Use short, but descriptive names.
2. Organize images in folders that make sense.
3. Provide comments within the Dockerfile.
4. Provide a short description of the image in the README.
5. Use the following format at the top of Dockerfiles:

```
# Author: YOU <YOUR EMAIL>
# cybergisx/IMAGE NAME:VERSION
# https://hub.docker.com/repository/docker/cybergisx/IMAGE NAME
# ANY IMPORTANT SOFTWARE VERSIONS/NOTES
# Changes:
# * A SHORT DESCRIPTION OF CHANGES SINCE PREVIOUS VERSION
```


## To Do

* Create workflow to automatically push images. [Waiting on Hub allowing organizational tokens](https://github.com/docker/roadmap/issues/461).