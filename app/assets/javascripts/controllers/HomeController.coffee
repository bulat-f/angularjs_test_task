angular
  .module('blog')

  .controller 'HomeCtrl', [
    '$scope'
    '$stateParams'
    'posts'
    ($scope, $stateParams, posts) ->
      $scope.posts = posts.posts
      $scope.totalItems = posts.total_entries
      $scope.itemsPerPage = posts.per_page
      $scope.currentPage = parseInt(posts.page, 10);

      $scope.setPage = (pageNo) ->
        $scope.currentPage = pageNo
        return

      $scope.maxSize = 5
      $scope.bigTotalItems = 175
      $scope.bigCurrentPage = 1

  ]