# This dockerfile for build nginx image

# using lightweight debian image
FROM	debian:bookworm-slim

WORKDIR	setup/

COPY	tools/setup.sh .
RUN	chmod +x setup.sh
RUN	./setup.sh

COPY	conf/default /etc/nginx/sites-available/default

EXPOSE	80
EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
