PATH = srcs/
DOCKER = /usr/bin/docker

ps:
	@cd $(PATH) && $(DOCKER) compose ps

up:
	@cd $(PATH) && $(DOCKER) compose up

upd:
	@cd $(PATH) && $(DOCKER) compose up -d

down:
	@cd $(PATH) && $(DOCKER) compose down

images:
	$(DOCKER) images

clean:
	$(DOCKER) images --format "{{.Repository}}" | awk '{print $1}' | xargs -I {} docker rmi {}

.PHONY: up upd down clean images ps