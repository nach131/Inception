#!/bin/sh

mysql -u "root" -p"$MYSQL_PASSWORD" << EOF
CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;
EOF

if [ $? -eq 0 ]; then
  echo "Base de datos $WORDPRESS_DB_NAME creada con éxito."
else
  echo "Error al crear la base de datos."
fi