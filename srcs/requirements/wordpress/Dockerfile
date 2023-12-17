# wordpress Dockerfile

FROM	debian:bullseye-slim
WORKDIR	setup/

RUN	apt update && \
	apt install -y php-fpm wget && \
	rm -rf /var/lib/apt/lists/*

COPY	tools/install.sh .

RUN	chmod +x install.sh

CMD	["./install.sh"]
