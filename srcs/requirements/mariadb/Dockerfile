# Use a Debian base image
FROM debian:bullseye-slim
WORKDIR	setup/

# Set noninteractive mode to avoid prompts during package installation
ENV DEBIAN_FRONTEND="noninteractive"

# Install MySQL Server and other dependencies
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create the directory for the Unix socket
RUN mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld

COPY	tools/setup.sh .
# Expose the MySQL port
EXPOSE 3306

#CMD	["/bin/bash"]
# Start MySQL when the container starts
CMD ["mysqld", "--user=mysql", "--console"]
