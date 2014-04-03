
#
#Module dependencies.
# 

express = require 'express'
stylus = require('stylus')
nib = require('nib')
util = require 'util'
middle = require './middle'
user = require './controller/user'

app = express()

# Configuration
compile = (str, path) ->
  return stylus(str)
    .set('filename', path)
    .use(nib())

app.set('views', __dirname + '/views')
app.set('view engine', 'jade')
app.use(express.logger('dev'))
app.use(stylus.middleware({ src: __dirname + '/public', compile: compile}))
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(middle.logErrors);
app.use(middle.clientErrorHandler);
app.use(middle.errorHandler);


app.get '/' , user.index

app.listen 3009, ->
    console.log "Express server listening on port %d in %s mode", 3009, 'dev'
