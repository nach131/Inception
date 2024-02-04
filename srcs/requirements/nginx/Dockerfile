FROM alpine:3.18.6

# Actualizar el índice de paquetes e instalar NGINX
RUN apk update && apk add nginx

# Copiar la configuración de NGINX
COPY ./tools/nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
# Crear directorio para los archivos de nasa
RUN mkdir -p /usr/share/nginx/html/nasa

# Comando para ejecutar NGINX en primer plano
CMD ["nginx", "-g", "daemon off;"]
