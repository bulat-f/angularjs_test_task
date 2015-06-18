angular
  .module('blog')

  .controller 'SearchCtrl', [
    '$stateParams'
    '$scope'
    '$http'
    ($stateParams, $scope, $http) ->
      get = (request, page) ->
        request ||= ''
        page ||= 1 
        data = $http.get("/posts?search=#{request}&page=#{page}").then(
          (response) ->
            response.data
        ).then (response)->
          console.log response
          $scope.posts = response.posts
          $scope.totalItems = response.total_entries
          $scope.itemsPerPage = response.per_page
          $scope.currentPage = parseInt(response.page, 10)

      get($stateParams.request, null)

      $scope.setPage = (pageNo) ->
        $scope.currentPage = pageNo
        return
  ]