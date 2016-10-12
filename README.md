# NoDock
Docker Compose for Node projects with Node, MySQL, NGINX and Certbot images

**WARNING: THIS PROJECT IS STILL IN EARLY DEVELOPMENT, DO NOT USE IN PRODUCTION**

## Contents

- [Requirements](#Requirements)
- [Installation](#Installation)
- [Usage](#Usage)
- [Workspace](#Workspace)
- [HTTPS](#HTTPS)
    - [Self-signed certificates](#SelfSigned)
    - [Certbot](#Certbot)
- [Non-web project](#Non-Web)
- [Multiple Node containers](#Multi-Node)
- [More options](#More-Options)
    - [Change Node entrypoint](#Node-Entrypoint)
    - [Change Node environment](#Node-Environment)
    - [Change Node version](#Node-Version)
    - [Change Node project location](#Node-Project-Path)
    - [Change MySQL database/user/password](#MySQL-Database-User)
    - [Change NGINX reverse proxy port](#NGINX-Reverse-Proxy-Port)
- [Contributing](#Contributing)
- [License](#License)

<a name="Requirements"></a>
## Requirements

* [Docker Engine 1.12+](https://docs.docker.com/engine/installation/)
* [Docker Compose 1.8+](https://docs.docker.com/compose/install/)

<a name="Installation"></a>
## Installation
As a git submodule:
```
git submodule add https://github.com/Osedea/nodock.git
```

Clone into your project:
```
git clone https://github.com/Osedea/nodock.git
```
<a name="Usage"></a>
## Usage
```
cd nodock
# Simple app
docker-compose up -d node nginx
# or
# All containers
docker-compose up -d
```

To overwrite the `docker-compose.yml` file you can use a `docker-compose.override.yml`

```
# docker-compose.override.yml

version: '2'

services:
    [...]
```

<a name="Workspace"></a>
## Workspace
The `workspace` container is where you want to be manually running commands for `NoDock`. You can use this container to initialize your project, for task-automation, for [cronjobs](#Cronjobs), etc.

<a name="HTTPS"></a>
## Using HTTPS
By default HTTPS is disabled. To enable it, you may use the following settings

```
# docker-compose.override.yml
[...]
    nginx:
        build:
            args:
                web_ssl: "true"
```
Add your certificate to `nginx/certs/cacert.pem` and the private key to `nginx/certs/privkey.pem`.
<a name="SelfSigned"></a>
#### Generate and use a self-signed cert
`self_signed: "true"` will generate the necessary files, do note that `self_signed: "true"` as no effect if `web_ssl: "false"`

```
# docker-compose.override.yml
[...]
    nginx:
        build:
            args:
                web_ssl: "true"
                self_signed: "true"
```
<a name="Certbot"></a>
#### Use Certbot (Let's Encrypt) to generate the cert
`CN` must be a publicly accessible address and `EMAIL` should be the server admin contact email.

```
# docker-compose.override.yml
[...]
    nginx:
        build:
            args:
                web_ssl: "true"
    certbot:
        environment:
            CN: "example.com"
            EMAIL: "fake@gmail.com"
```
Don't forget to bring up the container if you plan on using certbot (`docker-compose up -d certbot`).
<a name="Non-Web"></a>
## Running a single non-web container
The default NGINX server block configuration is aimed at web projects but if you want to have a single non-web container you can do something similar to the following configuration.

```
# docker-compose.override.yml
[...]
    nginx:
        build:
            args:
                no_default: "true"
        ports:
            - "10000:10000"
```

Do note that using `no_default` makes `web_reverse_proxy_port`, `web_ssl` and `self_signed` have no effect.

You will then have to provide your own NGINX server block like so

```
# nginx/sites/custom-node.conf

server {
    listen 10000 default_server;

    location / {
        proxy_pass http://node:5000;
    }
}
```
<a name="Multi-Node"></a>
## Running multiple node containers
To add more node containers, simply add the following to your `docker-compose.override.yml` or environment specific docker-compose file.

```
# docker-compose.override.yml
[...]
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

<a name="Cronjobs"></a>
## Cronjobs
You can run cronjobs in the [Workspace](#Workspace) by storing them in the `workspace/crontab/root` file.
```
# workspace/crontab/root

* * * * * echo "Every Minute" >> /var/log/cron.log
```

<a name="More-Options"></a>
## More Options
To customize the NoDock installation, either add a `docker-compose.override.yml` in the NoDock directory or store environment specific configurations.

```
docker-compose -f nodock/docker-compose.yml -f docker-compose.dev.yml up -d
```
<a name="Node-Entrypoint"></a>
#### Change the node entrypoint
Use `main.js` instead of `index.js`
```
# docker-compose.override.yml
[...]
    node:
        entrypoint: run-nodock "node main.js"
```
<a name="Node-Environment"></a>
#### Change the Node Environment
The default `NODE_ENV` value is `production`, you can change it to development by doing the following
```
# docker-compose.override.yml
[...]
    node:
        environment:
            NODE_ENV: development
```
<a name="Node-Version"></a>
#### Use a specific Node version
The default node version is `latest`, this is **NOT** advisable for production
```
# docker-compose.override.yml
[...]
    node:
        build:
            args:
                node_version: 4.6.0
```
<a name="Node-Project-Path"></a>
#### Change the Node project path
You can specify a `project_path` to change the directory in which `npm` will perform it's `install` command and the directory in which `run-nodock` will run the entrypoint script. This is most desirable when running more than one Node project at a time since they are bound to each have their own `package.json` file.
```
# docker-compose.override.yml
[...]
    node:
        build:
            args:
                project_path: somefolder # note that this is the same as "/opt/app/somefolder"

```
<a name="MySQL-Database-User"></a>
#### Change the MySQL database/user/password
```
# docker-compose.override.yml
[...]
    mysql:
        build:
            args:
                mysql_database: default_database
                mysql_user: default_user
                mysql_password: secret
```
<a name="NGINX-Reverse-Proxy-Port"></a>
#### Change the NGINX reverse proxy port
Use port `8080` instead of `8000` to bind your Node server
```
# docker-compose.override.yml
[...]
    nginx:
        build:
            args:
                web_reverse_proxy_port: "8080"
```
<a name="Change-the-timezone"></a>
#### Change the timezone

To change the timezone for the `workspace` container, modify the `TZ` build argument in the Docker Compose file to one in the [TZ database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

For example, if I want the timezone to be `New York`:
```
# docker-compose.override.yml
[...]
     workspace:
        build:
            context: ./workspace
            args:
                tz: "America/New_York"
```
<a name="Contributing"></a>
## Contributing
Do not hesitate to contribute to NoDock by creating an issue, fixing a bug or bringing a new idea to the table.

To fix a bug or introduce a new feature, please create a PR, we will merge it in to the `master` branch after review.

We thank you in advance for contributing.
<a name="License"></a>
## License
[MIT License](https://github.com/laradock/laradock/blob/master/LICENSE) (MIT)
