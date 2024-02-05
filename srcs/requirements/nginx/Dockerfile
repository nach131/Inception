FROM alpine:3.18.6

LABEL version="1.0"
LABEL description="NGINX Server"

# Actualizar el índice de paquetes e instalar NGINX
RUN apk update && apk add --no-cache nginx openssl

# WORKDIR 
# Copiar la configuración de NGINX
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nmota-bu.42.fr /etc/nginx/conf.d/nmota-bu.42.fr.conf
COPY ./conf/nasa.nmota-bu.42.fr /etc/nginx/conf.d/nasa.nmota-bu.42.fr.conf

COPY ./tools/cert.sh /usr/local/bin/cert.sh
RUN chmod +x /usr/local/bin/cert.sh
ENTRYPOINT [ "/usr/local/bin/cert.sh" ]


EXPOSE 80
# Crear directorio para los archivos de nasa
# RUN mkdir -p /usr/share/nginx/html/nasa
# COPY ./tools/index.html /usr/share/nginx/html/nasa

WORKDIR /usr/share/nginx/html

# Comando para ejecutar NGINX en primer plano
CMD ["nginx", "-g", "daemon off;"]
