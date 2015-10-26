# phpMyAdmin on Alpine

[![docker hub](https://img.shields.io/badge/docker-image-blue.svg?style=flat-square)](https://registry.hub.docker.com/u/splattael/phpmyadmin/)
[![imagelayers](https://badge.imagelayers.io/splattael/phpmyadmin:latest.svg)](https://imagelayers.io/?images=splattael/phpmyadmin:latest)

Image size: 44.53 MB

## Docker run

    docker run \
      --link mysql:mysql \
      --name phpmyadmin \
      -P \
      splattael/phpmyadmin

## Software

* apache2-2.4.16-r9
* php-apache2-5.6.14-r0
* phpMyAdmin 4.5.1 (from source)

## Release

* `Makefile`: Bump `VERSION`
* `Dockerfile`: Bump `PHPMYADMIN_VERSION` and `RELEASE_DATE`
* `README.md`: Bump versions in `Software` section
* Run `make release`
