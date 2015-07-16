# phpMyAdmin on Alpine

[![docker hub](https://img.shields.io/badge/docker-image-blue.svg?style=flat-square)](https://registry.hub.docker.com/u/splattael/phpmyadmin/)

Image size: 44.53 MB

## Docker run

    docker run \
      --link mysql:mysql \
      --name phpmyadmin \
      -P \
      splattael/phpmyadmin

## Software

* apache2-2.4.10-r0
* php-apache2-5.6.8-r0
* phpMyAdmin 4.4.11 (from source)
