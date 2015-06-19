template = (path) ->
  "assets/#{path}.html"

angular
  .module('blog')
  .directive 'search', ->
    {
      restrict: 'E'
      controller: 'SearchCtrl'
      templateUrl: template('searchField')
    }