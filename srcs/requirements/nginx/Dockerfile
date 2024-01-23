# This dockerfile for build nginx image

# using lightweight debian image
FROM	debian:bookworm-slim

WORKDIR	app/

RUN	apt-get update && \
	apt-get install nginx openssl -y && \
	rm -rf /var/lib/apt/lists/*

COPY	tools/init.sh .
RUN	chmod +x init.sh

COPY	conf/default /etc/nginx/sites-available/default

EXPOSE	80
EXPOSE	443

CMD	["./init.sh"]
