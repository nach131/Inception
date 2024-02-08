PATH = srcs/
DOCKER = /usr/bin/docker

up:
	@cd $(PATH) && $(DOCKER) compose up

down:
	@cd $(PATH) && $(DOCKER) compose down

images:
	$(DOCKER) images

clean:
	$(DOCKER) images --format "{{.Repository}}" | awk '{print $1}' | xargs -I {} docker rmi {}

.PHONY: up down clean images
