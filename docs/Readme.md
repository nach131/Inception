
Dockerfile:
```bash
FROM nginx:alpine

RUN apk --no-cache add openssl ca-certificates && \
    rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/conf.d/default.conf
```
Este `Dockerfile` se basa en la imagen oficial de Nginx para Alpine Linux y añade OpenSSL y el certificado raíz necesarios para habilitar TLS 1.2. Además, copia un archivo de configuración de Nginx llamado `nginx.conf` al directorio de configuración predeterminado de Nginx.

docker-compose.yml:
```yaml
version: '3'
services:
  nginx:
    container_name: nginx_tls12
    image: your-repository/your-image-name:latest
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
    ports:
      - "80:80"
      - "443:443"
    depends_on:
      - tls12-certs
    networks:
      - your-network-name

  tls12-certs:
    container_name: tls12_certs
    image: your-repository/your-image-name:latest
    volumes:
      - ./certs:/etc/nginx/ssl/
    networks:
      - your-network-name

networks:
  your-network-name:
```
Este archivo de `docker-compose.yml` define dos contenedores: `nginx` y `tls12-certs`. El contenedor `nginx` corre la imagen personalizada que se basa en el `Dockerfile`, utiliza la configuración de Nginx proporcionada en `nginx.conf` y expone puertos 80 (para HTTP) y 443 (para HTTPS).

El contenedor `tls12-certs` se encarga de almacenar los certificados necesarios para habilitar TLS 1.2 en el contenedor Nginx. Este contenedor monta un volumen compartido llamado `./certs`, que debe estar presente en la máquina local y contiene los archivos de certificación SSL requeridos.

Asegúrate de reemplazar `your-repository/your-image-name:latest` con el nombre de tu repositorio Docker y el nombre de tu imagen personalizada. Además, asegúrate de que `./nginx.conf` sea un archivo de configuración válido para Nginx y que esté en la misma ruta en tu sistema local.

//=========================================================================
Nginx con TLS 1.2 habilitado utilizando el certificado SSL `cert.pem` y la clave privada `key.pem`. Asegúrate de reemplazar estos nombres de archivo por los tuyos propios:
```bash
server {
    listen 80;
    server_name example.com www.example.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl;
    server_name example.com www.example.com;

    ssl_certificate /etc/nginx/ssl/cert.pem;
    ssl_certificate_key /etc/nginx/ssl/key.pem;
    ssl_protocols TLSv1.2;
    ssl_prefer_server_ciphers on;
    ssl_ciphers "ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:DHE-DSS-AES256-SHA:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA";
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;

    location / {
        proxy_pass http://your-app-server:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto https;
    }
}
```
Esta configuración se basa en la directiva `ssl_protocols`, que especifica únicamente los protocolos TLS 1.2 y 1.3 para permitir las conexiones HTTPS. Además, se establecen ciertas opciones de seguridad adicionales mediante la configuración de cifrados y tiempos de sesión.

La directiva `proxy_pass` indica que el tráfico HTTPS se redirigirá a un servidor interno en `http://your-app-server:8080`. Asegúrate de reemplazar `your-app-server` por la dirección o nombre de host del servidor que aloja tu aplicación.

También se establecen algunas cabeceras HTTP adicionales (`Host`, `X-Real-IP`, `X-Forwarded-For` y `X-Forwarded-Proto`) para proporcionar información sobre la conexión al servidor interno.


//=========================================================================


Para ejecutar el contenedor Nginx con TLS 1.2 habilitado basándose en los archivos `Dockerfile`, `docker-compose.yml` y los certificados necesarios en una máquina local con Docker Compose instalado, sigue estos pasos:

1. Crear un directorio llamado `certs` donde almacenar los certificados SSL necesarios.
2. Crea un archivo llamado `nginx.conf` que contenga la configuración de Nginx necesaria para tu entorno específico.
3. Copia o genera los certificados SSL en el directorio `certs`.
4. Ejecuta el siguiente comando para levantar el stack de contenedores:
```bash
docker-compose up -d --build
```
Este comando construye e inicia los dos contenedores definidos en el archivo `docker-compose.yml`. La opción `-d` ejecuta los contenedores en segundo plano y la opción `--build` reconstruye las imágenes si es necesario.

Una vez que los contenedores se hayan iniciado correctamente, deberías poder acceder a tu aplicación web utilizando HTTP en `http://localhost:80` y HTTPS en `https://localhost:443`.


===========

ysqld_safe:

    mysqld_safe es un script de inicio seguro para el servidor MySQL/MariaDB. Proporciona una capa adicional de seguridad y manejo de errores al iniciar el servidor de base de datos.

    Este script se encarga de configurar variables de entorno, manejar señales del sistema, y realizar otras tareas relacionadas con la inicialización segura del servidor MySQL/MariaDB.

    Usar mysqld_safe en el contexto de la instrucción CMD significa que cuando se inicie el contenedor, este script se ejecutará y se encargará de iniciar el servidor MariaDB.

Es importante tener en cuenta que dependiendo de la imagen de MariaDB que estás utilizando y sus configuraciones específicas, puede haber alternativas o diferencias en la manera en que se inicia el servidor. Por ejemplo, algunas imágenes de MariaDB pueden utilizar directamente el comando mysqld en lugar de mysqld_safe.

Si tienes un script personalizado de inicialización o configuración, es posible que desees ajustar la instrucción CMD para incluir ese script específico después de que se haya iniciado el servidor MariaDB. En el ejemplo anterior, se ha modificado para ejecutar un script personalizado (db_init.sh) después de iniciar el servidor.