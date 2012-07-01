var express = require('express');
var pg = require('pg');

var app = express.createServer(express.logger());

app.get('/', function(request, response) {
    pg.connect(process.env.DATABASE_URL, function(err, client) {
      var query = client.query('SELECT * FROM players');
    
      query.on('row', function(row) {
        response.send(JSON.stringify(row));
      });
    });

});

var port = process.env.PORT || 5000;
app.listen(port, function() {
  console.log("Listening on " + port);
});

