FROM alpine:3.12.3

RUN apk update && apk add nginx && apk add wget
RUN apk add openrc && rc-update add nginx default
RUN rc-status && touch /run/openrc/softlevel 
RUN adduser -D -g 'www' www && mkdir /www
RUN chown -R www:www /var/lib/nginx /www
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl \
    php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip \
    php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath \
    php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext \
    php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib \
    php7-curl php7-ctype php7-session php7-mbstring
RUN rc-update add php-fpm7 default
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN rm phpMyAdmin-5.1.0-all-languages.tar.gz
RUN mv phpMyAdmin-5.1.0-all-languages /www/phpmyadmin
RUN chmod -R 777 /www/phpmyadmin
#install telegraf
RUN	echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/setup.sh /setup.sh
RUN cd /www/phpmyadmin/ &&  rm -rf config.sample.inc.php
ADD ./srcs/config.inc.php /www/phpmyadmin/config.inc.php
RUN chmod +x /setup.sh
EXPOSE 5000
CMD sh setup.sh