.PHONY: test

COMPOSE_PROJECT_NAME=$PROJECT_NAME

COMPOSE_FILE?=docker-compose.yml

BASE_DIR=$(PWD)

COMPOSE_OVERRIDE_FILE?=
ifeq ($(COMPOSE_OVERRIDE_FILE),)
COMPOSE=docker-compose -p $(COMPOSE_PROJECT_NAME) -f $(COMPOSE_FILE)
else
COMPOSE=docker-compose -p $(COMPOSE_PROJECT_NAME) -f $(COMPOSE_FILE) -f $(COMPOSE_OVERRIDE_FILE)
endif

build:
	$(COMPOSE) build

up:
	$(COMPOSE) pull
	$(COMPOSE) up -d $(COMPOSE_PROJECT_NAME)

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) kill
	$(COMPOSE) rm --force

shell:
	docker exec -it $(COMPOSE_PROJECT_NAME)_$(COMPOSE_PROJECT_NAME)_1 /bin/sh

init: build up shell

logs:
	docker logs -f $(COMPOSE_PROJECT_NAME)_$(COMPOSE_PROJECT_NAME)_1