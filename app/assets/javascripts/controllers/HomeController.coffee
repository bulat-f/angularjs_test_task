angular
  .module('blog')

  .controller 'HomeCtrl', [
    '$state'
    '$stateParams'
    '$scope'
    '$http'
    ($state, $stateParams, $scope, $http) ->
      page = $stateParams.id || 1
      $http.get("/posts?&page=#{page}").then(
        (response) ->
          response.data
      ).then (response)->
        $scope.posts = response.posts
        $scope.totalItems = response.total_entries
        $scope.itemsPerPage = response.per_page
        $scope.currentPage = parseInt(page, 10)

      $scope.$watch('currentPage', (newValue, oldValue) ->
        $state.go('page', { id: newValue }) if newValue && oldValue
        )
  ]