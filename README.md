# Inception

## Openssl
OpenSSL is an open-source command line tool that is commonly used to generate private keys, create CSRs (Corporate Social Responsibility), install your SSL(secure sockets layer)/TLS(transport layer security) certificate, and identify certificate information. encryption and decyption, Generate Keys and Certificates, generate Digital signatures.

![Funny GIF](https://www.visolve.com/uploads/images/ssl_intro1.gif)

#### Encryption && Decryption , Hashing

> There is Two types of Key Based Encrption:

> Symmetric Encryption : Encrypt ANd Decrypt using the same key

> Asymmetric Encyption : Encypt and Decrypt using diffrent keys (public, private)

> Hybrid Encrption : use both Asymmetric and Symmetric Encrption (Asymmetric Encrption to facilitate Key Exchange && Secret Key used with Symmetric Encrption for bulk data) (SSL/TLS SSH/IPSEC .. every security protocol)

* **Encrption**

    `openssl enc "chipher" -in "input file" -out "output file"`

* **Decryption**

    `openssl enc "chipher" -d -in "input file" -out "output file"`

**Chipers**

    openssl enc -list

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

    HTTPS - HTML transferred with HTTP protected with SSL
> SSL/TLS can also protect other data transfer

    SSL VPN

**How do ssl/tls protect data?**

Data sent across a wire can be captured by anyone in the middle (MITM)
* Purpuse of SSL/TLS is to protect the data in three ways
    * Confidentiality : Data is only accessible by Client and Server (Encryption)
    * Intergrity : Data is not modified between Client and Server (Hashing)
    * Authentication : Client/Server are indeed who they they are (PKI)

**Key PLayers**
* Client
    * Entity intiating the tls handshake
    * webbrower
    * optionaly authenticated (rare) (client rarely provide the certificate)

* Server
    * entity receiving the tls handshake
    * webserver
    * always authenticated (always provide the certificate)

* Certificate Authority
    * governing entity the issueing certificates
    * trusted by client and server
    * provides Trusted Anchor
        * if the client trusts the CA and the CA provides a trusted cirtificate to the server so the client can trust the server

> SSL not used do to some bugs and CVEs : https://www.wallarm.com/what/poodle-attack (poodle attack 2014)

**Encryption Ensures the confidentiality**

**Hashing Ensures the integriti**

*Process for using Asymmetric Key pair for Signatures*
    1. Sender Calculates a Hash of a message (MAC) message Authentication Code
    2. Sender encrypts resulting digest with it's private key
    3. Receiver decrypts the signature with Sender public key
    4. Receiver calculates Hash of receivied message

if received has decypt the message with sender public key successfully then it means the message successfuly sent and it's from the sender (confidentiality)

if both digests match this prove that : message hasn't changed since sender signed it (integriti) and only the sender could have created the signature (because it's the only one have it's private key)(Authentication)

* How SSl/TLS uses Cryptography?

