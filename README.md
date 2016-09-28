# nodock
Docker-Compose for Node projects with MySQL and NGINX images

**WARNING: THIS PROJECT IS STILL IN EARLY DEVELOPMENT, DO NOT USE IN PRODUCTION**

## Usage

#### Build and Run the containers
```
docker-compose up -d
```

## Customization

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
