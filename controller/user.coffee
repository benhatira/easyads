fs = require('fs')
util = require('util')
config = require('../config')

exports.index = (req, res) ->
  #console.log 'space'
  res.end '12345678'