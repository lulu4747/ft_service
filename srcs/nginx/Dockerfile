FROM alpine:3.12

RUN apk update
RUN apk add nginx
RUN apk add openssl

RUN mkdir -p /usr/share/nginx/html
RUN echo "html stuff" > /usr/share/nginx/html/index.html
RUN mkdir -p /run/nginx

COPY ./default.conf /etc/nginx/conf.d/
COPY ./setup.sh .

RUN sh setup.sh

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
