## RabbitMQ Service

### Setup

Copy the index file in this folder to the project root:

```bash
cd <project_folder>/

cp -r nodock/_examples/rabbitmq/* .
```

### Usage

```bash
cd nodock/

docker-compose up -d rabbitmq node nginx
```

By going to `127.0.0.1` in your browser you should be seeing a message indicating that `node` has successfully connected to `rabbitmq`. If you are seeing an error message, wait a few seconds for RabbitMQ to spin up and reload the page.
