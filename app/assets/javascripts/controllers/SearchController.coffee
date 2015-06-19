angular
  .module('blog')

  .controller 'SearchCtrl', [
    '$state'
    '$stateParams'
    '$scope'
    '$http'
    ($state, $stateParams, $scope, $http) ->
      $scope.request = $stateParams.request || ''
      $http.get("/api/posts?search=#{$scope.request}").then(
        (response) ->
          response.data
      ).then (response)->
        $scope.posts = response.posts
      $scope.search = ->
        console.log $stateParams
        $state.go($state.current.name, { request: $scope.request })
  ]