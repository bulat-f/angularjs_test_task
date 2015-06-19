angular
  .module('blog')

  .controller 'SearchCtrl', [
    '$state'
    '$stateParams'
    '$scope'
    ($state, $stateParams, $scope) ->
      $scope.request = $stateParams.request || ''
      $scope.search = ->
        $state.go('search', { request: $scope.request })
  ]