var express = require('express');
var pg = require('pg');
var conString = process.env.DATABASE_URL || 'tcp://pablo:pableras@localhost/bookclub';
  
var app = express.createServer(express.logger());

app.get('/', function(request, response) {
    pg.connect(conString, function(err, client) {
      client.query("SELECT * FROM players", function(err, result) {
        response.send(JSON.stringify(result.rows));
      });
      
    });
});

var port = process.env.PORT || 5000;
app.listen(port, function() {
  console.log("Listening on " + port);
});

