express = require("express")
coffeekup = require 'coffeekup'

pg = require("pg")
conString = process.env.DATABASE_URL or "tcp://pablo:pableras@localhost/bookclub"

app = express.createServer(express.logger())
app.set 'view engine', 'coffee'
app.register '.coffee', require('coffeekup').adapters.express

app.get "/", (request, response) ->
  pg.connect conString, (err, client) ->
    client.query "SELECT * FROM players", (err, result) ->
      response.render 'index', foo: 'siii'

port = process.env.PORT or 5000
app.listen port, ->
  console.log "Listening on " + port
