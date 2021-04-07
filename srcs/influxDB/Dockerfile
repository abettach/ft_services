FROM alpine:3.12.3

# VOLUME [ “/sys/fs/cgroup” ]
RUN apk update
# ADD the community repositories to the repositories file reference, where exist grafana and telegraf
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add openrc influxdb && apk add telegraf
RUN openrc && touch /run/openrc/softlevel
COPY ./srcs/setup.sh /
RUN chmod +x /setup.sh
EXPOSE 8086
CMD /setup.sh