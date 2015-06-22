@app
  .controller 'PostsNewCtrl', [
    '$state', '$scope', '$http'
    ($state, $scope, $http) ->
      $scope.create = (post) ->
        $http.post('/api/posts', post).then (response) ->
          $scope.response = response.data
          $state.go 'posts.show', { id: $scope.response.id } if $scope.response.success
    ]