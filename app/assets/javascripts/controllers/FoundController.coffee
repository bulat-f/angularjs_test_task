angular
  .module('blog')

  .controller 'FoundCtrl', [
    '$state'
    '$stateParams'
    '$scope'
    'Posts'
    ($state, $stateParams, $scope, Posts) ->
      Posts.getSearch($stateParams.request).then (response) ->
        $scope.posts = response.posts
  ]