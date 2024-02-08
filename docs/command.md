

SELECT User FROM mysql.user;
show databases;

docker build -t nmota-bu_wp:1.0.0 requirements/wordpress/
docker run -e MYSQL_DATA_DIR=$HOME/data/dos -d 0a07bf159034
docker run alpine 
docker run -rm 

docker images
docker rmi nombre_de_la_imagen[:etiqueta]

Eliminar todas las imágenes no utilizadas:
docker image prune

docker-compose up --build

SHOW VARIABLES LIKE "bind_address";
SHOW VARIABLES LIKE "skip_networking";

mysql

web
saber los dominios activos
sudo nginx -T | grep server_name
nginx -s reload


MODIFICAR EL /etc/hosts

192.168.134.131 nmota-bu.42.fr
192.168.134.131 nasa.nmota-bu.42.fr

docker run --name some-mariadb -e MYSQL_ROOT_PASSWORD=klingon -d mariadb

--network srcs_tokemo \

docker run -d \
--rm \
--name mysql \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=root \
-v mysql_tmp:/var/lib/mysql \
mysql:5.7.28

docker run -d \
--rm \
--name phpmyadminc \
--link mysql \
-e PMA_HOST=mysql \
-e MYSQL_ROOT_PASSWORD=root \
-p 8080:80 \
phpmyadmin/phpmyadmin

========
docker run -d -v /my/data/directory:/home/vsftpd \
-p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
-e FTP_USER=myuser -e FTP_PASS=mypass \
-e PASV_ADDRESS=127.0.0.1 -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 \
--name vsftpd --restart=always fauria/vsftpd
=========

docker restart adminer
