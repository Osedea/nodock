## Simple Web Service

### Setup

Copy the index file in this folder to the project root:

```bash
cd <project_folder>/

cp nodock/_examples/simple-web/index.js .
cp nodock/_examples/simple-web/package.json .
```

### Usage

```bash
cd nodock/

docker-compose up -d node nginx
```

By going to `127.0.0.1` in your browser you should be seeing a nice greeting!