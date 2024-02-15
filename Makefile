srcs = srcs/

build:
	docker-compose --project-directory $(srcs) build

up:
	docker-compose --project-directory $(srcs) up

down:
	docker-compose --project-directory $(srcs) down

fclean: down
	docker-compose --project-directory $(srcs) rm

logs:
	docker-compose --project-directory $(srcs) logs
