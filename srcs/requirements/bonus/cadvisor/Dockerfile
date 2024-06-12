FROM	debian:bookworm

LABEL   vendor="madebyamine"
LABEL   version="1.0"
LABEL   description="Custom cadvisor image based on debian:bookworm (12) image"
LABEL   release_date="2024-01-01"

WORKDIR	main/

RUN	apt-get update && apt-get install -y \
	wget \
	&& rm -rf /var/lib/apt/lists/*

RUN	wget https://github.com/google/cadvisor/releases/download/v0.39.3/cadvisor
RUN	chmod +x cadvisor

EXPOSE	8080
CMD	["./cadvisor"]
