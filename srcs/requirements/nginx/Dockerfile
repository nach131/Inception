FROM alpine:3.18.6

LABEL version="1.0"
LABEL description="NGINX Server"

# Actualizar el índice de paquetes e instalar NGINX
RUN apk update && apk add --no-cache nginx

# WORKDIR 
# Copiar la configuración de NGINX
COPY ./tools/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
# Crear directorio para los archivos de nasa
RUN mkdir -p /usr/share/nginx/html/nasa
COPY ./tools/index.html /usr/share/nginx/html/nasa

# Comando para ejecutar NGINX en primer plano
CMD ["nginx", "-g", "daemon off;"]
