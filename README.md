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
