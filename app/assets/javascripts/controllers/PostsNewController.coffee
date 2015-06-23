@app
  .controller 'PostsNewCtrl', [
    '$state', '$scope', '$http'
    ($state, $scope, $http) ->
      $scope.signed_in = true
      $scope.create = (post) ->
        $http.post('/api/posts', post).then (response) ->
          if response.status == 201
            $state.go 'posts.show', { id: response.data.id }
          else
            if response.status == 200
              $scope.signed_in = false
            
    ]