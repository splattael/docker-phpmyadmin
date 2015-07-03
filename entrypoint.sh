#!/bin/sh

config=$PHPMYADMIN_DIR/config.inc.php
if [ "`grep NO_SECRET $config`" != "" ]; then
  secret=$(cat /dev/urandom  | uuencode -m - | head -2 | tail -1)
  sed -i "s,NO_SECRET,$secret," $config
fi

if [ "$1" = "" ]; then
  exec /usr/sbin/httpd -D FOREGROUND
else
  exec "$@"
fi
