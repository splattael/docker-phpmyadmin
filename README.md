# phpMyAdmin on Alpine

## Docker run

    docker run \
      --link mysql:mysql
      --name phpmyadmin \
      -P \
      splattael/phpmyadmin

## Software

    # apk info apache2 php5 phpmyadmin
    apache2-2.4.10-r0 description:
    A high performance Unix-based HTTP server

    apache2-2.4.10-r0 webpage:
    http://httpd.apache.org/

    apache2-2.4.10-r0 installed size:
    4280320

    phpmyadmin-4.3.8-r0 description:
    A Web-based PHP tool for administering MySQL

    phpmyadmin-4.3.8-r0 webpage:
    http://www.phpmyadmin.net/

    phpmyadmin-4.3.8-r0 installed size:
    35409920
