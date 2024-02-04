FROM alpine:3.18.6

RUN mkdir -p /var/www/html

# RUN apk update &&\
# 	apk upgrade

EXPOSE  8080

COPY ./tools/wp_init.sh /usr/local/bin/wp_init.sh

CMD echo "desde Makefile nach"