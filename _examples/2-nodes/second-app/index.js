var express = require('express');
var app = express();

app.get('/', function(req, res) {
    res.send('You are pretty cool');
});

app.listen(10000);
