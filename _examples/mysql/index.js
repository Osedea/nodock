var express = require('express');
var app = express();
var mysql = require('mysql');

app.get('/', function(req, res) {
    var connection = mysql.createConnection({
      host     : 'mysql',
      user     : 'default_user',
      password : 'secret'
    });
    connection.connect(function(err) {
        if (err) {
            res.send('Could not connect to MySQL ' + err.stack);
        } else {
            res.send('Connected to MySQL - Thread ' + connection.threadId);
        }
    });
});

app.listen(8000);
