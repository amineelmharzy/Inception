# Use a Debian base image
FROM	debian:bookworm-slim
WORKDIR	app/

# Copy Mysql secure installation script to the work directory
COPY	tools/mysql_install.sh .

# Set noninteractive mode to avoid prompts during package installation
ENV	DEBIAN_FRONTEND="noninteractive"
ENV	$(cat ../../.env)

# Install MySQL Server and other dependencies
RUN	apt-get update && \
	apt-get install -y mariadb-server && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Create the directory for the Unix socket
RUN	mkdir -p /run/mysqld && \
	chown mysql:mysql /run/mysqld

# Expose the MySQL port
EXPOSE	3306

# Start MySQL when the container starts
CMD	["mysqld", "--user=mysql", "--console"]
