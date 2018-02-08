## 2 Nodes

### Setup

Copy all the files in this folder to the project root:

```bash
cd <project_folder>/

cp -r nodock/_examples/2-nodes/* .
mv docker-compose.override.yml nodock/
mv node2.conf nodock/nginx/sites/
```

### Usage

```bash
cd nodock/

docker-compose up -d node node2 nginx
```

By going to `127.0.0.1` in your browser you should be seeing a nice greeting! By going to `127.0.0.1:10000` in your browser you should be seeing _another_ nice greeting!
