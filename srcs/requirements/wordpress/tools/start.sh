#!/bin/sh
set -e

# Iniciar php-fpm en segundo plano
php-fpm &

# Iniciar Redis en segundo plano
redis-server &

# Esperar que ambos procesos estén en ejecución
wait
