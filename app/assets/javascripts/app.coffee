@template = (path) ->
  "assets/#{path}.html"

@app = angular
  .module('blog', [
    'ui.router'
    'ui.bootstrap.pagination'
    'templates'
  ])