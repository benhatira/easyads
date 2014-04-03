exports.logErrors = (err, req, res, next) ->
  console.error(err.stack)
  next(err)

exports.clientErrorHandler = (err, req, res, next)->
  if (req.xhr)
    res.send(500, { error: 'Something blew up!' })
  else
    next(err);

exports.errorHandler = (err, req, res, next) ->
  res.status(500)
  res.render('error', { error: err })
