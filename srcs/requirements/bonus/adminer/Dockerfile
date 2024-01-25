FROM	debian:bookworm-slim

WORKDIR	app/

RUN	apt update && \
	apt install nginx wget -y && \
	rm -rf /var/lib/apt/lists/*

COPY	tools/install.sh .
RUN	chmod +x install.sh

CMD	["./install.sh"]
