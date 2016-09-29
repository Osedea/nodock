# NoDock
Docker Compose for Node projects with MySQL and NGINX images

**WARNING: THIS PROJECT IS STILL IN EARLY DEVELOPMENT, DO NOT USE IN PRODUCTION**

## Requirements
* [Docker Engine 1.12+](https://docs.docker.com/engine/installation/)
* [Docker Compose 1.8+](https://docs.docker.com/compose/install/)

## Usage

#### Install in your project

As a submodule:
```
git submodule add https://github.com/Osedea/nodock.git
```

#### Build and Run the containers
```
cd nodock
docker-compose up -d
```

## Allow HTTPS

By default HTTPS is disabled. To enable it, you may use the following settings

```
# docker-compose.override.yml

version: '2'

services:
    nginx:
        build:
            args:
                web_ssl: "true" # defaults to "false"
                self_signed: "true" # defaults to "false"
```

`self_signed: "true"` will generate the necessary files, do note that `self_signed: "true"` as no effect if `web_ssl: "false"`

If you want to use your own: leave `self_signed: "false"`, add the certificate to `nginx/certs/cacert.pem` and the private key to `nginx/certs/privkey.pem`.


## Running multiple node containers
To add more node containers, simply add the following to your `docker-compose.override.yml` or environment specific docker-compose file.
```
# docker-compose.override.yml

version: '2'

services:
    node2: # name of new container
        extends: node # extends the settings from the "node" container
        entrypoint: run-nodock "node alternate.js" # the entrypoint for the "node2" container
    nginx:
        ports:
            - "10000:10000" # the port(s) to forward for the "node2" container
        links:
            - node2 # link "nginx" to "node2"
```

You'll also need to add a server block for "node2".
```
# nginx/sites/node2.conf

server {
    listen 10000 default_server;

    location / {
        proxy_pass http://node2:8000;
    }
}
```

## Customization

To customize the NoDock installation, either add a `docker-compose.override.yml` in the NoDock directory or store environment specific configurations.

```
docker-compose -f nodock/docker-compose.yml -f docker-compose.dev.yml up -d
```

#### Change the node entrypoint

Use `main.js` instead of `index.js`
```
# docker-compose.override.yml

version: '2'

services:
    node:
        entrypoint: run-nodock "node main.js"
```

#### Change the MySQL environments variables
```
# docker-compose.override.yml

version: '2'

services:
    mysql:
        environment:
            MYSQL_DATABASE: custom_database
            MYSQL_USER: custom_user
            MYSQL_PASSWORD: custom_password
            MYSQL_ROOT_PASSWORD: custom_root_password
```

#### Change the NGINX reverse proxy port

Use port `8080` instead of `8000` to bind your Node server
```
# docker-compose.override.yml

version: '2'

services:
    nginx:
        build:
            args:
                web_reverse_proxy_port: "8080"
```

#### Change the NODE_ENV variable

The default `NODE_ENV` value is `production`, you can change it to development by doing the following
```
# docker-compose.override.yml

version: '2'

services:
    node:
        environment:
            NODE_ENV: development
```

#### Use a specific Node version

The default node version is `latest`, this is **NOT** advisable for production
```
# docker-compose.override.yml

version: '2'

services:
    node:
        build:
            args:
                node_version: 4.6.0
```
