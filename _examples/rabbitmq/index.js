var express = require('express');
var app = express();
var amqp = require('amqplib');

app.get('/', function(req, res) {
    amqp.connect('amqp://rabbitmq').then(function(conn) {
        return conn.createChannel();
    }).then(function(ch) {
        res.send('Connected to rabbitmq');
    }).catch(function() {
        res.send('Could not connect to rabbitmq');
    });
});

app.listen(8000);
