# phpMyAdmin on Alpine 3.2

[![docker hub](https://img.shields.io/badge/docker-image-blue.svg?style=flat-square)](https://registry.hub.docker.com/u/splattael/phpmyadmin/)
[![imagelayers](https://badge.imagelayers.io/splattael/phpmyadmin:latest.svg)](https://imagelayers.io/?images=splattael/phpmyadmin:latest)

## Docker run

    docker run \
      --link mysql:mysql \
      --name phpmyadmin \
      -P \
      splattael/phpmyadmin

### mod_remoteip.so

By default the HTTP header `X-Forwarded-For` is used in access log
so proxying requests is doable.

For e.g. nginx proxy do:

    location / {
      proxy_pass http://backend;
      proxy_set_header Host $host;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }


## Software

* apache2-2.4.16-r0
* php-apache2-5.6.17-r0
* phpMyAdmin 4.5.5 (from source)

## Release

* `Makefile`: Bump `VERSION`
* `Dockerfile`: Bump `PHPMYADMIN_VERSION` and `RELEASE_DATE`
* `README.md`: Bump versions in `Software` section
* Run `make release`
