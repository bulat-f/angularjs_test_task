angular
  .module('blog')

  .controller 'SearchCtrl', [
    '$state'
    '$stateParams'
    '$scope'
    'Posts'
    ($state, $stateParams, $scope, Posts) ->
      $scope.request = $stateParams.request || ''
      Posts.getSearch($scope.request).then (response) ->
        $scope.posts = response.posts
      $scope.search = ->
        console.log $stateParams
        $state.go($state.current.name, { request: $scope.request })
  ]