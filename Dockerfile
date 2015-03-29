FROM alpine
MAINTAINER Peter Suschlik <peter@suschlik.de>

ENV RELEASE_DATE 2015-03-29
ENV PHPMYADMIN_DIR /usr/share/webapps/phpmyadmin/

RUN \
  apk add -U apache2 php-apache2 phpmyadmin && \
  chown -R apache:apache $PHPMYADMIN_DIR && \
  rm -fr $PHPMYADMIN_DIR/setup

ADD config.inc.php $PHPMYADMIN_DIR

EXPOSE 80

CMD /usr/sbin/apachectl -D FOREGROUND

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
