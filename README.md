# phpMyAdmin on Alpine

Image size: 46.48 MB

## Docker run

    docker run \
      --link mysql:mysql
      --name phpmyadmin \
      -P \
      splattael/phpmyadmin

## Software

* apache2-2.4.10-r0
* php-apache2-5.6.5-r0
* phpMyAdmin 4.4.1 (from source)
