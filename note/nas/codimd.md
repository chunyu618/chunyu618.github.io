# Install codimd on synology NAS

### Goal

To have a online collaborative markdown notes that can be accessed from internet.

### What is needed

- (synology) NAS server
- docker
- dockercompose
- A database running as a docker container
- A codimd server running as a docker container 

### Install docker and docker-compose on NAS

To install docker on NAS, just go to package center , search for "docker" and then click install.

docker-compose will also be installed, but usually its version would be too old, so we need to download a newer version mamually.

```shell
$ sudo su 
$ cd /var/packages/Docker/target/usr/bin/
$ mv docker-compose docker-compose_bak
# X.XX.X is the desired version, in my case it is 1.26.2 
$ curl -L https://github.com/docker/compose/releases/download/X.XX.X/docker-compose-`uname -s`-`uname -m` -o docker-compose
$ chmod +x docker-compose
```

### Start service

Copy the following:

```yml
# Using version 3 to provide play-with-docker badge
# You can change to version 2 without breaking.
#version: '2'
version: '3'
services:
  database:
    # Don't upgrade PostgreSQL by simply changing the version number
    # You need to migrate the Database to the new PostgreSQL version
    image: postgres:9.6-alpine
    #mem_limit: 256mb         # version 2 only
    #memswap_limit: 512mb     # version 2 only
    #read_only: true          # not supported in swarm mode please enable along with tmpfs
    #tmpfs:
    #  - /run/postgresql:size=512K
    #  - /tmp:size=256K
    environment:
      - POSTGRES_USER=<user name>
      - POSTGRES_PASSWORD=<password>
      - POSTGRES_DB=<database name>
    # This volume is used to store database data  
    volumes:
      - <volume name 1>:/var/lib/postgresql/data
    #logging:
    #  - driver: json-file
    #  - options:
    #    - max-size: "10m"
    networks:
      backend:
    restart: always

  # MySQL example
  # Most of the documentation that applies to PostgreSQL applies also to MySQL
  #database:
  #    # You should be able to upgrade MySQL without problems
  #    # but to make sure no even when a problem appears you
  #    # should have a backup
  #    image: mariadb:10
  #    environment:
  #      - MYSQL_USER=hedgedoc
  #      - MYSQL_PASSWORD=password
  #      - MYSQL_DATABASE=hedgedoc
  #      - MYSQL_ALLOW_EMPTY_PASSWORD=true
  #    volumes:
  #      - database:/var/lib/mysql
  #      # This config provides UTF-8 support to the database by default
  #      # If this config is not used, HedgeDoc breaks as it tries to write
  #      # UTF-8 to a latin database.
  #      - ./resources/utf8.cnf:/etc/mysql/conf.d/utf8.cnf
  #    networks:
  #      backend:
  #    restart: always

  app:
    # Uncomment the following section to build the image yourself:
    #build:
    #  context: .
    #  dockerfile: debian/Dockerfile
    #  args:
    #    - "VERSION=master"
    #    - "HEDGEDOC_REPOSITORY=https://github.com/hedgedoc/hedgedoc.git"
    image: quay.io/hedgedoc/hedgedoc:1.6.0
    #mem_limit: 256mb         # version 2 only
    #memswap_limit: 512mb     # version 2 only
    #read_only: true          # not supported in swarm mode, enable along with tmpfs
    #tmpfs:
    #  - /tmp:size=10M
    #  # Make sure you remove this when you use filesystem as upload type
    #  - /hedgedoc/public/uploads:size=10M
    environment:
      # DB_URL is formatted like: <databasetype>://<username>:<password>@<hostname>:<port>/<database>
      # Other examples are:
      # - mysql://hedgedoc:password@database:3306/hedgedoc
      # - sqlite:///data/sqlite.db (NOT RECOMMENDED)
      # - For details see the official sequelize docs: http://docs.sequelizejs.com/en/v3/
      - CMD_DB_URL=postgres://<user name>:<password>@database:5432/<database name>
    volumes:
      # I don't know what is this volume being used for
      - <volume name 2>:/hedgedoc/public/uploads
    ports:
      # Ports that are published to the outside.
      # The latter port is the port inside the container. It should always stay on 3000
      # If you only specify a port it'll published on all interfaces. If you want to use a
      # local reverse proxy, you may want to listen on 127.0.0.1.
      # Example:
      # - "127.0.0.1:3000:3000"
      - "3000:3000"
    networks:
      backend:
    restart: always
    depends_on:
      - database

# Define networks to allow best isolation
networks:
  # Internal network bridge for communication between PostgreSQL/MySQL and codimd
  backend:

# Define named volumes so data stays in place
volumes:
  # Volume for PostgreSQL/MySQL database
  <volume name 1>:
  <volume name 2>:
```

Save it as `docker-compose.yml` and then run `docker-compose up -d` . (-d means running at backgraound)

And you can use it by `https://<NAS IP>:3000`

### Asscess codimd from outer Internet

TODO

### Reference

[hedgedoc/container](https://github.com/hedgedoc/container)

[【CodiMD】安裝踩雷筆記...](https://cynthiachuang.github.io/How-to-Setup-CodiMD/)
