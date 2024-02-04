# Archivo Makefile para implementar una aplicación en contenedores Docker

# Configuraciones
APP_NAME = mi-app
CONTAINER_IMAGE = mi-app-image
DOCKERFILE = Dockerfile

# Tareas
all: build push run

build:
	@docker build -t $(CONTAINER_IMAGE) .

push: build
	@docker push $(CONTAINER_IMAGE)

run: build
	@docker run --name $(APP_NAME) -p 8080:8080 $(CONTAINER_IMAGE)

remove:
	@docker rm $(APP_NAME)
	@docker rmi $(CONTAINER_IMAGE)

stop:
	@docker stop $(APP_NAME)

clean: remove stop

.PHONY: all build push run remove stop clean
```
Este Makefile define varias tareas que realizan diferentes acciones en el proceso de implementación de contenedores Docker:

- `all`: Ejecuta las tareas `build`, `push` y `run`.
- `build`: Construye una imagen Docker a partir del archivo Dockerfile.
- `push`: Sube la imagen construida al registro de contenedores Docker Hub o otro registro que se esté utilizando.
- `run`: Inicia un contenedor a partir de la imagen Docker y lo ejecuta en el puerto 8080.
- `remove`: Elimina el contenedor y la imagen Docker correspondientes.
- `stop`: Detiene el contenedor si está corriendo.
- `clean`: Ejecuta las tareas `remove` y `stop` para limpiar todos los contenedores y imágenes relacionados con la aplicación.

Las tareas `build`, `push` y `run` son dependencias del objetivo `all`, lo que significa que se ejecutarán automáticamente al ejecutar `make all`. También hay un target `clean` para limpiar todos los contenedores y imágenes relacionados con la aplicación.

Es importante tener en cuenta que este Makefile solo es una guía básica y podría necesitar modificaciones según las especificidades de su proyecto.

//=========================================================================

.PHONY: build up down

build:
    docker-compose build

up:
    docker-compose up -d

down:
    docker-compose down

    build: Construye las imágenes de Docker según el Dockerfile y los archivos necesarios.
    up: Levanta los servicios definidos en el archivo docker-compose.yml en segundo plano (modo detached).
    down: Detiene y elimina los contenedores asociados a los servicios definidos en docker-compose.yml.

Para usarlo, guarda este contenido en un archivo llamado Makefile en el mismo directorio que tus archivos Docker (Dockerfile, docker-compose.yml) y ejecuta los siguientes comandos:

    make build: Para construir las imágenes.
    make up: Para levantar los contenedores.
    make down: Para detener y eliminar los contenedores.
