#!/bin/sh

# WAIT_TIME=120
# CHECK_INTERVAL=15

# until mysqladmin ping -hlocalhost -uroot -p"${MYSQL_ROOT_PASSWORD}" >/dev/null 2>&1; do
#   echo "Waiting for MariaDB to be ready..."
#   sleep ${CHECK_INTERVAL}
#   WAIT_TIME=$((WAIT_TIME - CHECK_INTERVAL))

#   if [ ${WAIT_TIME} -le 0 ]; then
#     echo "Timeout reached. MariaDB not ready after waiting."
#     exit 1
#   fi
# done

# # Intentar crear la base de datos y capturar errores
# if mysql -u "root" -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME}"; then
#   echo "Base de datos $WORDPRESS_DB_NAME creada con éxito."
# else
#   echo "Error al crear la base de datos."
#   exit 1
# fi

if mysql -u "root" -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME}; \
  CREATE USER IF NOT EXISTS '${WORDPRESS_DB_USER}'@'localhost' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}'; \
  GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'localhost'; \
  GRANT ALL PRIVILEGES ON *.* TO 'root'@'myadm.srcs_tokemo' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION; \
  GRANT ALL PRIVILEGES ON wordpress.* TO '${WORDPRESS_DB_NAME}'@'localhost'; \
  GRANT ALL PRIVILEGES ON *.* TO '${WORDPRESS_DB_USER}'@'wp.srcs_tokemo' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}' WITH GRANT OPTION; \
  GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'wp.srcs_tokemo' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}'; \
  FLUSH PRIVILEGES;"; then
  echo "Base de datos $WORDPRESS_DB_NAME creada con éxito."
else
  echo "Error al crear la base de datos o el usuario."
  exit 1
fi
