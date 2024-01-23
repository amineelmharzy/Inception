#!/bin/bash

KEY=/etc/ssl/private/private.pem
CSR=/etc/ssl/certs/domain.csr
CER=/etc/ssl/certs/certificate.crt

# private key
openssl genrsa -out $KEY 4096

# certificate signing request CSR
openssl req -new -key $KEY -out $CSR -subj "/C=CA/ST=ON/L=Toronto/O=Amine Org/CN=Amine"

# self-signed CA certificate
openssl x509 -req -in $CSR -signkey $KEY -out $CER -days 1080

nginx -g 'daemon off;'
