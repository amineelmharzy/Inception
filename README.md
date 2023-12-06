# Inception

## Openssl
OpenSSL is an open-source command line tool that is commonly used to generate private keys, create CSRs (Corporate Social Responsibility), install your SSL(secure sockets layer)/TLS(transport layer security) certificate, and identify certificate information. encryption and decyption, Generate Keys and Certificates, generate Digital signatures.

![Funny GIF](https://www.visolve.com/uploads/images/ssl_intro1.gif)

#### Encryption && Decryption

* **Encrption**

    `openssl enc "chipher" -in "input file" -out "output file"`

* **Decryption**

    `openssl enc "chipher" -d -in "input file" -out "output file"`

**Chipers**

    openssl enc -list

**Examples***

    openssl enc -des3 -in plaintext.txt -out encrypted.txt # encrypt
    # enter passphrase or you add -k option to add it explicitly to the openssl comamnd
    openssl enc -des3 -d -in encrypted.txt -out decrypted.txt # decrypt
