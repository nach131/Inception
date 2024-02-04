`docker-compose.yml` y el `Dockerfile` correspondiente para crear una imagen de Docker con NGINX y TLSv1.3 en la penúltima versión estable de Alpine Linux:

1. Creación del archivo `Dockerfile`:
```bash
FROM alpine:latest as base
RUN apk add --no-cache openssl nginx
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80 443

FROM base as nginx
COPY --from=base /etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY . /etc/nginx/html
RUN rm -rf /var/lib/apt/lists/*
```
El `Dockerfile` contiene dos etapas: la primera construye la base con Alpine Linux y las dependencias necesarias, mientras que la segunda etapa copia el archivo de configuración `nginx.conf` y los contenidos del directorio HTML al contenedor final.

2. Creación del archivo `docker-compose.yml`:
```yaml
version: '3'
services:
  web:
    build: .
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./html:/etc/nginx/html
```
El `docker-compose.yml` define un servicio llamado `web`, que utiliza el archivo `Dockerfile` en la misma carpeta para construir la imagen de Docker. Además, abre puertos 80 y 443 para la comunicación HTTP y HTTPS respectivamente, y monta un volumen compartido con la carpeta `html` para almacenar los archivos estáticos del sitio web.

Puedes construir y ejecutar el contenedor utilizando los siguientes comandos:
```bash
# Construir la imagen
$ docker-compose build

# Iniciar el contenedor
$ docker-compose up -d
```
Asegúrate de tener una certificación SSL válida y configurada en el archivo `nginx.conf` antes de ejecutar el contenedor para habilitar TLSv1.3.

//=========================================================================

Para obtener una certificación SSL válida, sigue estos pasos generales:

1. Elegir un proveedor de certificados SSL: Existen varios proveedores de certificados SSL en línea, como Let's Encrypt, Comodo, GeoTrust y otros. Elije el que mejor se adapte a tus necesidades y presupuesto.

2. Solicitar un certificado: Una vez que hayas seleccionado un proveedor de certificados SSL, sigue las instrucciones proporcionadas para solicitar el certificado. A menudo, esto implica proporcionar información sobre tu dominio y verificar el control del mismo.

3. Descargar o generar la clave privada: Una vez que hayas solicitado el certificado SSL, debes generar o descargar la clave privada correspondiente. En caso de usar Let's Encrypt, utiliza los comandos `certbot` para generar la clave privada y obtener el certificado.

4. Configurar NGINX: Una vez que tengas las claves públicas y privadas del certificado SSL, modifica el archivo de configuración `nginx.conf` para incluir los certificados SSL en la sección correspondiente. Asegúrate de establecer TLSv1.3 como protocolo de comunicación segura y ajustar las opciones de cifrado según sea necesario.

5. Reiniciar NGINX: Una vez que hayas actualizado la configuración del certificado SSL, reinicia el servicio NGINX para que tome efecto.

6. Verificar y mantener el certificado: Después de obtener el certificado SSL, verifica su validez y establecimiento en la web. Asegúrate de renovar o actualizar el certificado SSL cuando sea necesario para mantener la protección y confidencialidad de tus datos.

Aquí hay un ejemplo de cómo configurar NGINX para usar una certificación SSL:
```perl
server {
    listen 80;
    listen [::]:80;
    server_name example.com www.example.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;
    server_name example.com www.example.com;

    # Certificado SSL
    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    # TLSv1.3 y cifrado
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384';

    # Ruta de acceso a los archivos estáticos
    root /var/www/html;

    # Rutas y acciones
    location / {
        try_files $uri $uri/ =404;
    }
}
```

//=========================================================================
