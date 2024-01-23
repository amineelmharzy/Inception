# wordpress Dockerfile

FROM	debian:bookworm-slim

WORKDIR	/app

RUN	apt update && \
	apt upgrade -y && \
	apt install -y php-fpm php-mysql wget postfix && \
	rm -rf /var/lib/apt/lists/*

COPY	conf/wp-config.php .
COPY	tools/install.sh .

RUN	chmod +x install.sh

EXPOSE	9000
CMD	["./install.sh"]
