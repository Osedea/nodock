var express = require('express');
var app = express();
var r = require('rethinkdb');

app.get('/', function(req, res) {
    r.connect({
        host: 'rethinkdb',
        port: 28015,
        authKey: '',
    }, function(err) {

        if (!err) {
            res.send('You are amazing');
        } else {
            res.send('Could not connect to RethinkDB :(');
        }

    });
});

app.listen(8000);
