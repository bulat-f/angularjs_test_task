angular
  .module('blog')

  .controller 'HomeCtrl', [
    '$scope'
    'posts'
    ($scope, posts) ->
      $scope.posts = posts
      $scope.totalItems = 64
      $scope.currentPage = 1

      $scope.setPage = (pageNo) ->
        $scope.currentPage = pageNo
        return

      $scope.maxSize = 5
      $scope.bigTotalItems = 175
      $scope.bigCurrentPage = 1

  ]