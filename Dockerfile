FROM alpine:3.6
MAINTAINER Peter Leitzen <peter@leitzen.de>

ENV RELEASE_DATE 2017-12-29
ENV PHPMYADMIN_VERSION 4.7.7

ENV PHPMYADMIN_DIR /usr/share/webapps/phpmyadmin/
ENV PHPMYADNIN_PACKAGE phpMyAdmin-$PHPMYADMIN_VERSION-english
ENV PHPMYADMIN_DOWNLOAD https://files.phpmyadmin.net/phpMyAdmin/$PHPMYADMIN_VERSION/$PHPMYADNIN_PACKAGE.tar.gz

ENV REQUIRED_PACKAGES apache2 php5 php5-apache2 php5-mysqli php5-zip php5-zlib php5-bz2 php5-ctype php5-gd php5-mcrypt php5-json php5-openssl

RUN \
  apk add -U --no-cache $REQUIRED_PACKAGES && \
  rm -fr /usr/bin/php

RUN \
  apk add -U wget && \
  cd /tmp && \
  wget -q --no-check-certificate $PHPMYADMIN_DOWNLOAD && \
  tar xzf $PHPMYADNIN_PACKAGE.tar.gz && \
  mkdir -p /usr/share/webapps && \
  mv $PHPMYADNIN_PACKAGE $PHPMYADMIN_DIR && \
  rm -fr $PHPMYADMIN_DIR/config.sample.inc.php && \
  rm -fr $PHPMYADMIN_DIR/setup && \
  chown -R apache:apache $PHPMYADMIN_DIR && \
  apk del --purge wget && \
  rm -fr /var/cache/apk/* && \
  rm -fr /tmp/*

ADD config.inc.php $PHPMYADMIN_DIR
ADD phpmyadmin.conf /etc/apache2/conf.d/

RUN mkdir -p /run/apache2

WORKDIR $PHPMYADMIN_DIR

EXPOSE 80

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
