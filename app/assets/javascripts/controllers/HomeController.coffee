angular
  .module('blog')

  .controller 'HomeCtrl', [
    '$state'
    '$stateParams'
    '$scope'
    'Posts'
    ($state, $stateParams, $scope, Posts) ->
      Posts.getPage($stateParams.id).then (response)->
        $scope.posts = response.posts
        $scope.totalItems = response.total_entries
        $scope.itemsPerPage = response.per_page
        $scope.currentPage = parseInt(response.page || 1, 10)

      $scope.$watch('currentPage', (newValue, oldValue) ->
        $state.go('page', { id: newValue }) if newValue && oldValue
        )
  ]