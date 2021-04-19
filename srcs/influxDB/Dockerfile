FROM alpine:3.12.3

RUN apk update
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add openrc influxdb telegraf
RUN openrc && touch /run/openrc/softlevel
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/setup.sh /
RUN chmod +x /setup.sh
EXPOSE 8086
CMD /setup.sh