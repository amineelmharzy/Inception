# wordpress Dockerfile

FROM	debian:bookworm-slim

WORKDIR	/app
ENV	$(cat ~/Inception/srcs/.env)

RUN	apt update && \
	apt upgrade -y && \
	apt install -y php-fpm php-mysql wget && \
	rm -rf /var/lib/apt/lists/*

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY	tools/install.sh .

RUN	chmod +x install.sh

CMD	["./install.sh"]
