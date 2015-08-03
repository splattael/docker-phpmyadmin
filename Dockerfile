FROM alpine
MAINTAINER Peter Suschlik <peter@suschlik.de>

ENV RELEASE_DATE 2015-07-03
ENV PHPMYADMIN_VERSION 4.4.12

ENV PHPMYADMIN_DIR /usr/share/webapps/phpmyadmin/
ENV PHPMYADNIN_PACKAGE phpMyAdmin-$PHPMYADMIN_VERSION-english
ENV PHPMYADMIN_DOWNLOAD https://files.phpmyadmin.net/phpMyAdmin/$PHPMYADMIN_VERSION/$PHPMYADNIN_PACKAGE.tar.gz

RUN \
  apk add -U apache2 php-apache2 php-mysqli php-zip php-zlib php-bz2 php-ctype php-gd php-mcrypt php-json php-openssl && \
  rm -fr /var/cache/apk/* && \
  rm -fr /usr/bin/php

RUN \
  apk add -U curl && \
  cd /tmp && \
  curl -LOs $PHPMYADMIN_DOWNLOAD && \
  tar xzf $PHPMYADNIN_PACKAGE.tar.gz && \
  mkdir -p /usr/share/webapps && \
  mv $PHPMYADNIN_PACKAGE $PHPMYADMIN_DIR && \
  rm -fr $PHPMYADMIN_DIR/config.sample.inc.php && \
  rm -fr $PHPMYADMIN_DIR/setup && \
  chown -R apache:apache $PHPMYADMIN_DIR && \
  apk del --purge curl && \
  rm -fr /var/cache/apk/* && \
  rm -fr /tmp/*

ADD config.inc.php $PHPMYADMIN_DIR
ADD phpmyadmin.conf /etc/apache2/conf.d/

WORKDIR $PHPMYADMIN_DIR

EXPOSE 80

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
