@app
  .controller 'PostsShowCtrl', [
    '$stateParams'
    '$scope'
    'Posts'
    ($stateParams, $scope, Posts) ->
      Posts.getPost($stateParams.id).then (response) ->
        $scope.post = response
    ]