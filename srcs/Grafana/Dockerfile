FROM alpine:3.12.3

# VOLUME [ “/sys/fs/cgroup” ]
RUN apk update
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add wget openrc libc6-compat && apk add telegraf
RUN openrc && touch /run/openrc/softlevel
RUN wget https://dl.grafana.com/oss/release/grafana-7.5.2.linux-amd64.tar.gz
#https://grafana.com/grafana/download/7.5.2?platform=linux
RUN tar -zxvf grafana-7.5.2.linux-amd64.tar.gz
RUN mv grafana-7.5.2 grafana
COPY ./srcs/defaults.ini /grafana/conf/defaults.ini
#https://github.com/grafana/grafana/blob/master/conf/defaults.ini
RUN rm -rf grafana-7.5.2.linux-amd64.tar.gz
COPY ./srcs/setup.sh /
RUN chmod +x /setup.sh
CMD /setup.sh
EXPOSE 3000