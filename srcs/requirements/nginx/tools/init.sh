#!/bin/bash

# private key
openssl genrsa -out $TLS_CERTIFICATION_PRIVATE_KEY 4096

# certificate signing request CSR
openssl req -new -key $TLS_CERTIFICATION_PRIVATE_KEY -out $TLS_CERTIFICATION_SIGNING_REQUEST -subj "/C=CA/ST=ON/L=Toronto/O=Amine Org/CN=Amine"

# self-signed CA certificate
openssl x509 -req -in $TLS_CERTIFICATION_SIGNING_REQUEST -signkey $TLS_CERTIFICATION_PRIVATE_KEY -out $TLS_CERTIFICATION -days 365

nginx -g 'daemon off;'
