# Inception

## docker

### docker
Docker is a platform developing, running and deploying your applications. Docker enables you to seperate your applications from your os. Docker provides the ability to package aand run an application in an isolated environment called a container. The isolation and security lets you run many containers simulaneously on a given host. This ensures that the application will run on any computing environment, regardless of any customized settings that machine might have.

### images
It is a static, read-only template, blueprint that contains the instructions for creating a container.

### containers
Containers are a lightwright, standalone that includes everything needed to run an application, so you don't need to rely on what's installed in the host.
Containers isolate the application from the underlying system. containers are a running instance of a docker image.
A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state.
By default, a container is relatively well isolated from other containers and its host machine. You can control how isolated a container's network, storage, or other underlying subsystems are from other containers or from the host machine.

### why use docker?
  . Ease of moving and maintaining your application  
  . Running your service on hardware that is much cheaper than standard servers  
  . Fast deployment, ease of creating new instances, and faster migrations  
  . Better security, less access needed to work with the code running inside containers, and fewer software dependencies  
  . Scalability - many containers can be placed in a single host  
  . Sharing containers with your project members  

### How docker works
Docker uses a client-server architecture (docker client, docker daemon). The docker client talks with the docker daemon which oes the heavy lifting of building, running and destributing your docker containers.
The docker client an daemon can run on the same systemm, or you can connect a docker client to a remote docker daemon. 
The docker client and daemon communicate using Docker Api (REST API) over UNIX sockets or a network interface.
Docker compose is another docker client that ease working with applications consisting of a set of contaienrs.

### Docker daemon
The docker daemon listens for a Docker API requests and manages Docker objects such as images, containers, networks and volumes.

### Docker client
the Docker client (docker) is the primary used to interact with Docker using Docker API.
When using commands such as (docker run), the client sends these commands to docker daemon, which execute them.
The docker client can communicate with more that one daemons.

### Docker registries
Docker registry stores Docker images, it can be private or public.

### Docker uses namespaces
Docker is written in the Go programming language. Docker uses a technology called namespaces to provide the isolate workspace called the called the container. when you run a container, docker creates a set of namespaces for that container.
these namespaces provie a layer isolation, each container runs in a separate namespace and its access is limited to that namespaces.
In computing, a namespace is a set of signs (names) that are used to identify and refer to objects of various kinds. A namespace ensures that all of a given set of objects have unique names so that they can be easily identified. 

[related resourse](https://docs.docker.com/get-started/overview/)

### Make docker daemon running remote

**Create `daemon.json` file in `/etc/docker:`**

     {"hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"]}

**create docker systemd custom config : `/etc/systemd/system/docker.service.d/override.conf`**

    [Service]
     ExecStart=
     ExecStart=/usr/bin/dockerd --config-file /etc/docker/daemon.json

**Apply changes**

    systemctl daemon-reload
    systemctl restart docker.service

**In your machine set `DOCKER_HOST` environment varaible**

    export DOCKER_HOST=remote-host-address:2375

### Docker API
Docker provies an api for interacting with the Docker daemon(called Docker engine api).
[Docker Api docs](https://docs.docker.com/engine/api/v1.44/)

  List images : `curl 127.0.0.1:2375/v1.41/images/json`  
  List containers : `curl 127.0.0.1:2375/v1.41/containers/json`  

### Docker network
Container networking refers to the abality of communication or connecting between containers or non-docker workloads.
Containers have networking enabled by default, and the can make outgoing connections. A container has no information about:
  * what kind of network it's attached to
  * whetever their peers are also docker workloads or not.

A container only sees a [network interface, IP address, gateway, routing table, dns service] and other networking details unless using "none" network driver.

**User-defined networks**

   you can create custom, user-defined networks, and connect multiple containers to the same network, once connected to a user-define network, containers are communicate with each other using container IP addresses or container names.

**Network drivers**

  * bridge: The default network driver. If you don't specify a driver, this is the type of network you are creating. Bridge networks are commonly used when your application runs in a container that needs to communicate with other containers on the same host.
  * host: Remove network isolation between the container and the Docker host, and use the host's networking directly.
  * none: Completely isolate a container from the host and other containers.
  * overlay: Overlay networks connect multiple Docker daemons together and enable Swarm services and containers to communicate across nodes. This strategy removes the need to do OS-level routing

### Docker volume

By default all files created inside a container are stored on a writable container layer. That's means:
    * the data exists in container no longer exists
    * it's hard to use this data in another container or proccess

Docker has two options for containers to store files on the host machine so that the files are persisted even after the container stops: volumes, build mounts.
Also docker supports storing files in memory on host machine. tmpfs (linux), named pipes (windows).

   * Volumes are stored in a part of the host filesystem which is managed by Docker (/var/lib/docker/volumes/ on Linux). Non-Docker processes should not modify this part of the filesystem. Volumes are the best way to persist data in Docker.

   * Bind mounts may be stored anywhere on the host system. They may even be important system files or directories. Non-Docker processes on the Docker host or a Docker container can modify them at any time.

   * tmpfs mounts are stored in the host system's memory only, and are never written to the host system's filesystem.


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

**When does a TLS handshake occur?**

  * A TLS handshake takes place whenever a user navigates to a website over HTTPS and the browser first begins to query the website's origin server. A TLS handshake also happens whenever any other communications use HTTPS, including API calls and DNS over HTTPS queries.

  * TLS handshakes occur after a TCP connection has been opened via a TCP handshake.
What happens during a TLS handshake?

**During the course of a TLS handshake, the client and server together will do the following:**

  * Specify which version of TLS (TLS 1.0, 1.2, 1.3, etc.) they will use
  * Decide on which cipher suites (see below) they will use
  * Authenticate the identity of the server via the server’s public key and the SSL certificate authority’s digital signature
  * Generate session keys in order to use symmetric encryption after the handshake is complete

[refrence](https://www.cloudflare.com/learning/ssl/what-happens-in-a-tls-handshake/) [other refrence](https://auth0.com/blog/the-tls-handshake-explained/)

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
    1. Hashing : Fingerprint && Mac (Intergrity, Authentication) [Bulk Data]
    2. Symmetric Encryption : Encryption (confidentiality) [Bulk Data]
    3. Asymmetric Encryption : Key Exchange (Establish Shared Keys) && Signatures (Intergrity, Authentication) && Encryption (Confidentiality) [Limited Data]

* Now let's understand what is the PKI?

> We Have and client and a server. they should communicate to each other

> They will Use Symmetric Encryption for confidentiality
> Mac For integriti (those two steps requires mutual secret keys so we first need to establish the Symmetric keys)
> To do that we need to Asymmetric Encryption to perform Key Exchange

> But we miss the authentication because every body can generate asymmetric keys. (Her we need CA Cirtificate Authority)


* In the bulk data process (Recommonded Hyprid Encryption)
    1. The server should generate a key pair {private, public}
    2. CA is trusted by client
    3. CA will generate a Certificate (this certificate says that ["Every body has the private key of that publick Key __ is the server of course and surely"])
    4. Certificate is Signed by the CA (the Signiture Created by the Certificate Authority)
    5. because of the client trust the CA and the certificate is signed by CA . now that's provide Authentication to the certificate it selft (it won't be changed)
    6. Since the certificate not changed now the asymmetric keys that the certificate validate also inherit Authentication.
    7. So the MAC also inherit Authentication.
 
Client , Server, CA => PKI

#### Openssl self-signed and root ca create

**private key**

`openssl genrsa -out $KEY 4096`

**certificate signing request CSR**

`openssl req -new -key $KEY -out $CSR -subj "/C=CA/ST=ON/L=Toronto/O=Amine Org/CN=Amine"`

**self-signed CA certificate**

`openssl x509 -req -in $CSR -key $KEY -out $CER -days 1080`

**genrate root CA private_key**

`openssl genrsa -aes-256-cbc -out $ROOT_CA_KEY -passout pass:$MY_CA_KEY_PASSWORD 4096`

**genrate self-signed root CA certificate**

`openssl req -x509 -key $ROOT_CA_KEY -sha512 -out $ROOT_CA -days 1080 -subj "/C=CA/ST=ON/L=Toronto/O=Amine Org/CN=Amine" -passin pass:$MY_CA_KEY_PASSWORD`

**sign CSR with Root CA certificate**

`openssl x509 -req -CA $ROOT_CA -CAkey $ROOT_CA_KEY -in $CSR -days 1080 -out $CER -CAcreateserial -passin pass:$MY_CA_KEY_PASSWORD`



