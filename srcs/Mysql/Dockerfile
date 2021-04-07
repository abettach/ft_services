FROM alpine:3.12.3

# VOLUME [ “/sys/fs/cgroup” ]
RUN apk update
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add mariadb mariadb-common mariadb-client openrc && apk add telegraf
RUN openrc && touch /run/openrc/softlevel
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/wordpress.sql /
COPY ./srcs/setup.sh /
RUN chmod +x /setup.sh
EXPOSE 3306
CMD /setup.sh