angular
  .module('blog')

  .controller 'HomeCtrl', [
    '$scope'
    'posts'
    ($scope, posts) ->
      $scope.posts = posts.posts
      $scope.totalItems = posts.total_entries
      $scope.itemsPerPage = posts.per_page
      $scope.currentPage = 1

      $scope.setPage = (pageNo) ->
        $scope.currentPage = pageNo
        return

      $scope.maxSize = 5
      $scope.bigTotalItems = 175
      $scope.bigCurrentPage = 1

  ]