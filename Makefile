srcs = srcs/

all : build

build:
	@docker-compose --project-directory $(srcs) build

up:
	@docker-compose --project-directory $(srcs) up -d

down:
	@docker-compose --project-directory $(srcs) down

start:
	@docker-compose --project-directory $(srcs) start

stop:
	@docker-compose --project-directory $(srcs) stop

log:
	@docker-compose --project-directory $(srcs) logs

ps:
	@docker-compose --project-directory $(srcs) ps

fclean: down
