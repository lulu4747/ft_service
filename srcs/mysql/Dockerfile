FROM alpine:3.11.7


RUN apk update
RUN apk add mysql mysql-client --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main
RUN apk add openrc
RUN apk add wget

RUN mkdir './data'

COPY ./srcs/* ./

RUN chmod +x install_db.sh

EXPOSE 3306

CMD ["sh", "start.sh"]
