# wordpress Dockerfile

FROM	debian:bookworm-slim

WORKDIR	/app
ENV	WORDPRESS_DATABASE_NAME="wordpress"
ENV	WORDPRESS_DATABASE_USER="leonardo"
ENV	WORDPRESS_DATABASE_PASSWORD="leonardo"
ENV	MARIADB_HOST="mariadb"

RUN	apt update && \
	apt upgrade -y && \
	apt install -y php-fpm php-mysql wget postfix && \
	rm -rf /var/lib/apt/lists/*

COPY	conf/wp-config.php .
COPY	tools/install.sh .

RUN	chmod +x install.sh

EXPOSE	9000
CMD	["./install.sh"]
