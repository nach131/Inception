SELECT User FROM mysql.user;
show databases;

docker build -t nmota-bu_wp:1.0.0 requirements/wordpress/

docker images
docker rmi nombre_de_la_imagen[:etiqueta]

Eliminar todas las imágenes no utilizadas:
docker image prune

