FROM alpine:3.18.6
# FROM alpine:3.16

RUN apk update &&\
	apk add mariadb mariadb-client && \
	mkdir -p /var/lib/mysql && \
	chown -R mysql:mysql /var/lib/mysql && \
	mysql_install_db --user=mysql --ldata=/var/lib/mysql

EXPOSE 3306

# COPY ./tools/db_init.sh /home
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN echo "Copiado configuración"

CMD ["mysqld_safe"]
# CMD ["sh", "-c", "/usr/bin/mysqld_safe && /home/db_init.sh"]