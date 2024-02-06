
build:
	@docker build -t db:1.0.1 srcs/requirements/mariadb

borrar
docker rmi srcs_wordpress
docker rmi srcs_nginx
docker rmi srcs_mariadb
