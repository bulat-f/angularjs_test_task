angular
  .module('blog')

  .controller 'PostsCtrl', [
    '$scope'
    '$stateParams'
    'post'
    ($scope, $stateParams, post) ->
      $scope.post = post
    ]