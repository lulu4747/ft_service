FROM alpine:3.11.7


RUN apk update; apk upgrade
RUN apk add mariadb mariadb-client
RUN apk add wget

RUN mkdir './data'

COPY ./srcs/* ./

RUN chmod +x install_db.sh

EXPOSE 3306

CMD ["sh", "start.sh"]
