angular
  .module('blog')

  .controller 'HomeCtrl', [
    '$scope'
    'posts'
    ($scope, posts) ->
      $scope.posts = posts
  ]