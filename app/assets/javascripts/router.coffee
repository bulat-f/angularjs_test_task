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
          templateUrl: template('posts/index')
          controller: 'HomeCtrl'
        .state 'page',
          url: '/page/{id}'
          templateUrl: template('posts/index')
          controller: 'HomeCtrl'
        .state 'search',
          url: '/search/{request}'
          templateUrl: template('found')
          controller: 'FoundCtrl'
        .state 'posts',
          url: '/posts'
          templateUrl: template('posts/posts')
          controller: 'HomeCtrl'
        .state 'posts.show',
          url: '/show/{id}'
          templateUrl: template('posts/show')
          controller: 'PostsCtrl'
      $urlRouterProvider.otherwise '/'
      return
    ]