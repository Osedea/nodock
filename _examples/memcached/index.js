var express = require('express');
var app = express();
var Memcached = require('memcached');

app.get('/', function(req, res) {
    var memcached = new Memcached("memcached:11211");
    memcached.connect('memcached:11211', function( err, conn ){
        if( err ) {
            res.send('Could not connect to memcached');
        } else {
            res.send('Connected to memcached');
        }
    });
});

app.listen(8000);
