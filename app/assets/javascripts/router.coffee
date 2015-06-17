template = (path) ->
  "assets/#{path}.html"

angular
  .module('blog')

  .config [
    '$stateProvider'
    '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->
      $stateProvider
        .state 'home',
          url: '/'
          templateUrl: template('home')
          controller: 'HomeCtrl'
        .state 'posts',
          url: '/posts/{id}'
          templateUrl: template('posts')
          controller: 'PostsCtrl'
      $urlRouterProvider.otherwise '/'
      return
    ]