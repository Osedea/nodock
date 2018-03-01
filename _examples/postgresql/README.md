## PostgreSQL

### Setup

Copy the index file in this folder to the project root:

```bash
cd <project_folder>/

cp -r nodock/_examples/postgresql/* .
```

### Usage

```bash
cd nodock/

docker-compose up -d nginx node postgresql
```

Visit `127.0.0.1` to see if Node successfully connected to PostgreSQL!
