

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



=========
en mariadb

mysql -u root -p

GRANT ALL PRIVILEGES ON *.* TO 'root'@'phpmyadm.srcs_tokemo' IDENTIFIED BY 'tu_contraseña' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'wp.srcs_tokemo' IDENTIFIED BY 'tu_contraseña' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'pedro'@'wp.srcs_tokemo' IDENTIFIED BY 'pedropsw' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON wordpress.* TO 'pedro'@'wp.srcs_tokemo' IDENTIFIED BY 'pedropsw';


FLUSH PRIVILEGES;
