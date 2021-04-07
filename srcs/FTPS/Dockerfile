FROM alpine:3.12.3

# VOLUME [ “/sys/fs/cgroup” ]
RUN apk update
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add vsftpd openrc openssl && apk add telegraf
RUN openrc && touch /run/openrc/softlevel
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=MA/ST=Khouribga/L=kh/O=abettach/CN=abettach"
COPY ./srcs/telegraf.conf /etc/
COPY ./srcs/vsftpd.conf /etc/vsftpd/
RUN echo -e "abettach\nabettach" | adduser abettach
COPY ./srcs/vsftpd.userslist /etc/vsftpd/
RUN echo "abettach" | tee -a /etc/vsftpd.userlist
COPY ./srcs/setup.sh /
RUN chmod +x /setup.sh
EXPOSE 21
CMD /setup.sh