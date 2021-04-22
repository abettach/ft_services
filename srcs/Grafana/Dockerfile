FROM alpine:3.12.3

RUN apk update
RUN apk add wget openrc libc6-compat
RUN openrc && touch /run/openrc/softlevel
RUN wget https://dl.grafana.com/oss/release/grafana-7.5.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.5.2.linux-amd64.tar.gz
RUN mv grafana-7.5.2 grafana
RUN rm -rf grafana-7.5.2.linux-amd64.tar.gz
RUN	echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/grafana.db /grafana/data/grafana.db
COPY ./srcs/setup.sh /
RUN chmod +x /setup.sh
EXPOSE 3000
CMD /setup.sh