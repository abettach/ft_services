FROM alpine:3.12.3

RUN apk update
RUN apk add nginx openssl openrc
RUN openrc && touch /run/openrc/softlevel
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=kh/O=abettach/CN=abettach"
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY ./srcs/nginx.conf /etc/nginx/
COPY ./srcs/index.html /www/
RUN	echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/setup.sh /
RUN chmod 777 /setup.sh
EXPOSE 80
EXPOSE 443
EXPOSE 22
CMD /setup.sh