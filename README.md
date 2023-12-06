# Inception

## Openssl
OpenSSL is an open-source command line tool that is commonly used to generate private keys, create CSRs (Corporate Social Responsibility), install your SSL(secure sockets layer)/TLS(transport layer security) certificate, and identify certificate information. encryption and decyption, Generate Keys and Certificates, generate Digital signatures.

![Funny GIF](https://www.visolve.com/uploads/images/ssl_intro1.gif)

#### Encryption && Decryption , Hashing

* **Encrption**

    `openssl enc "chipher" -in "input file" -out "output file"`

* **Decryption**

    `openssl enc "chipher" -d -in "input file" -out "output file"`

**Chipers**

    opensGsl enc -list

**Examples**

    openssl enc -des3 -in plaintext.txt -out encrypted.txt # encrypt
    # enter passphrase or you add -k option to add it explicitly to the openssl comamnd
    openssl enc -des3 -d -in encrypted.txt -out decrypted.txt # decrypt

**Hashing**
    
    openssl "hash_algorithm" filename #(md5, sha1, sha256, ...)

#### OpenSSL Public key infrastructure(PKI)

OpenSSL provides tools and libraries that are commonly used in the context of a PKI. Here are some ways OpenSSL can be used in a PKI.

* **Generate public && private key**

    **Private Key**

    `openssl genpkey -algorithm RSA -out private.key`

    **Public Key**

    `openssl rsa -pubout -in private.key -out public.key`

**Cirtificate**
> Cirtificates used to virity the website identity and it holds the public key that the user should use it to incrypt the packets and data using it.

> SSL/TLS create a secure, protected tunnel across the internet

    *HTTPS - HTML transferred with HTTP protected with SSL*
> SSL/TLS can also protect other data transfer

    *SSL VPN*
