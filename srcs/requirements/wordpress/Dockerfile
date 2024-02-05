FROM php:8.1-fpm-alpine

LABEL version="0.2"
LABEL description="Wordpress and php"

# persistent dependencies
RUN set -eux; \
	apk add --no-cache \
	# in theory, docker-entrypoint.sh is POSIX-compliant, but priority is a working, consistent image
	bash \
	# Ghostscript is required for rendering PDF previews
	ghostscript \
	# Alpine package for "imagemagick" contains ~120 .so files, see: https://github.com/docker-library/wordpress/pull/497
	imagemagick \
	;

# # Crear un directorio para almacenar los datos de WordPress
# RUN mkdir -p /var/www/html

# # Copiar WordPress al directorio de trabajo
# COPY wordpress /var/www/html

WORKDIR /var/www/html
# Establecer permisos adecuados
RUN chown -R nobody:nogroup .

# Exponer el puerto 9000 para PHP-FPM
EXPOSE 9000

# Iniciar PHP-FPM
CMD ["php-fpm"]
