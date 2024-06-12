FROM	debian:bookworm

LABEL   vendor="madebyamine"
LABEL   version="1.0"
LABEL   description="This image is based on debian:bookworm (12) image \
	and it running a html,css,js static website inside it using python"
LABEL   release_date="2024-01-01"

WORKDIR	main/

RUN	apt-get update && apt-get install -y \
	python3 \
	&& rm -rf /var/lib/apt/lists/*

COPY	src/ .

EXPOSE	7000
CMD	["nohup", "python3", "-m", "http.server", "7000"]
