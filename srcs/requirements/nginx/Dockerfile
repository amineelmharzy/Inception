# This dockerfile for build nginx image

# using lightweight debian image
FROM	debian:bookworm-slim

WORKDIR	app/

RUN	apt-get update && \
	apt-get install nginx openssl php-fpm php-mysql -y && \
	rm -rf /var/lib/apt/lists/*

COPY	tools/setup.sh .
RUN	chmod +x setup.sh

COPY	conf/default /etc/nginx/sites-available/default
#RUN	mv /var/www/html/index.nginx-debian.html /var/www/html/index.html

EXPOSE	80
EXPOSE	443

CMD	["./setup.sh"]
