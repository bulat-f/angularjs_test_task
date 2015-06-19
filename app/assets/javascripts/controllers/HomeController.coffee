angular
  .module('blog')

  .controller 'HomeCtrl', [
    '$state'
    '$stateParams'
    '$scope'
    '$http'
    ($state, $stateParams, $scope, $http) ->
      get = (page) ->
        page ||= 1
        data = $http.get("/posts?&page=#{page}").then(
          (response) ->
            response.data
        ).then (response)->
          $scope.posts = response.posts
          $scope.totalItems = response.total_entries
          $scope.itemsPerPage = response.per_page
          $scope.currentPage = parseInt(page, 10)

      get($stateParams.id)
      $scope.$watch('currentPage', (newValue, oldValue) ->
        $state.go('page', { id: newValue }) if newValue && oldValue
        )
  ]