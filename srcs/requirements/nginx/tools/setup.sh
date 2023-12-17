#!/bin/bash

KEY=/etc/ssl/private/private.pem
CSR=/etc/ssl/certs/domain.csr
CER=/etc/ssl/certs/certificate.crt

# install requirements
apt-get update && apt-get install nginx openssl -y && rm -rf /var/lib/apt/lists/*

# private key
openssl genrsa -out $KEY 4096

# certificate signing request CSR
openssl req -new -key $KEY -out $CSR -subj "/C=CA/ST=ON/L=Toronto/O=Amine Org/CN=Amine"

# self-signed CA certificate
openssl x509 -req -in $CSR -signkey $KEY -out $CER -days 1080
