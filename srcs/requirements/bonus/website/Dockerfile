FROM	debian:bookworm-slim

LABEL   vendor="madebyamine"
LABEL   version="1.0"
LABEL   description="This image is based on debian:bookworm (12) image \
	and it running a html,css,js static website inside it using python"
LABEL   release_date="2024-01-01"

WORKDIR	main/

RUN	apt update 
RUN	apt install python3 -y

COPY	src/ .

EXPOSE	7000
CMD	["python3", "-m", "http.server", "7000"]
