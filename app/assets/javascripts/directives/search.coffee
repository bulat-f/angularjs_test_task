@app
  .directive 'search', ->
    {
      restrict: 'E'
      controller: 'SearchCtrl'
      templateUrl: @template('search')
    }