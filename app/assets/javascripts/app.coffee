app = angular.module('blog', [])

app.controller 'BlogController', ->
  @posts = posts
  return

app.filter 'cut', ->
  (value, wordwise, max, tail) ->
    if !value
      return ''
    max = parseInt(max, 10)
    if !max
      return value
    if value.length <= max
      return value
    value = value.substr(0, max)
    if wordwise
      lastspace = value.lastIndexOf(' ')
      if lastspace != -1
        value = value.substr(0, lastspace)
    value + (tail or ' …')

posts = [
  {
    title: 'First post'
    cover: 'http://www.ocpsoft.org/wp-content/uploads/2013/01/angularjs.png'
    body: 'HTML is great for declaring static documents, but it falters when we try to use it for declaring dynamic views in web-applications. AngularJS lets you extend HTML vocabulary for your application. The resulting environment is extraordinarily expressive, readable, and quick to develop.'
  }
  {
    title: 'Second post'
    cover: 'http://www.ocpsoft.org/wp-content/uploads/2013/01/angularjs.png'
    body: 'Other frameworks deal with HTML’s shortcomings by either abstracting away HTML, CSS, and/or JavaScript or by providing an imperative way for manipulating the DOM. Neither of these address the root problem that HTML was not designed for dynamic views.'
  }
  {
    title: 'Extensibility'
    cover: 'http://www.ocpsoft.org/wp-content/uploads/2013/01/angularjs.png'
    body: 'AngularJS is a toolset for building the framework most suited to your application development. It is fully extensible and works well with other libraries. Every feature can be modified or replaced to suit your unique development workflow and feature needs. Read on to find out how.'
  }
]
