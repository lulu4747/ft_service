FROM alpine:3.12

RUN apk update
RUN apk add vsftpd
RUN apk add openssl
RUN mkdir /var/ftp/

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./vsftpd.userlist /etc/vsftpd/
COPY ./start.sh .

EXPOSE 21
EXPOSE 20
EXPOSE 30020
EXPOSE 30021

CMD ["sh", "start.sh"]
