## RethinkDB Service

### Setup

Copy the index file in this folder to the project root:

```bash
cd <project_folder>/

cp -r nodock/_examples/rethinkdb/* .
```

### Usage

```bash
cd nodock/

docker-compose up -d node rethinkdb nginx
```

By going to `127.0.0.1` in your browser you should be seeing a nice greeting!

You can access the RethinkDB GUI via `127.0.0.1:28080`.
