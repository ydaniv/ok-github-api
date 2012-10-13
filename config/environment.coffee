express = require 'express'
mongooseAuth = require('mongoose-auth')
require('./mongoose_oauth')

app.configure ->
  cwd = process.cwd()

  app.set 'view engine', 'jade'
  app.set 'view options', complexNames: true
  app.enable 'coffee'

  app.use express.static(cwd + '/public', maxAge: 86400000)
  app.use express.bodyParser()
  app.use express.cookieParser 'ok-github-api'
  app.use express.session secret: 'ok-github-api'
  app.use express.methodOverride()
  #app.use app.router
  app.use mongooseAuth.middleware()

