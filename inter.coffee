express = require("express")
pg = require("pg")
conString = process.env.DATABASE_URL or "tcp://pablo:pableras@localhost/bookclub"
app = express.createServer(express.logger())

app.get "/", (request, response) ->
  pg.connect conString, (err, client) ->
    client.query "SELECT * FROM players", (err, result) ->
      response.send JSON.stringify(result.rows)

port = process.env.PORT or 5000
app.listen port, ->
  console.log "Listening on " + port
  