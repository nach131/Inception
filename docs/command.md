SELECT User FROM mysql.user;
show databases;

docker build -t nmota-bu_wp:1.0.0 requirements/wordpress/
docker run -e MYSQL_DATA_DIR=$HOME/data/dos -d 0a07bf159034

docker images
docker rmi nombre_de_la_imagen[:etiqueta]

Eliminar todas las imágenes no utilizadas:
docker image prune

docker-compose up --build
