FROM	debian:bookworm-slim

WORKDIR	app/

RUN	apt update && \
	apt install wget php php-mysql php-fpm -y && \
	rm -rf /var/lib/apt/lists/*

COPY	tools/install.sh .
RUN	chmod +x install.sh

EXPOSE	8000

CMD	["./install.sh"]
