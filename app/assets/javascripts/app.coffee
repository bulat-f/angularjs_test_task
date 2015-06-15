app = angular.module('blog', [])
app.controller 'BlogController', ->
  @post = post
  return
post =
  title: 'First post'
  body: 'First post body.'
