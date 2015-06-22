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
        .state 'posts.new',
          url: '/new'
          templateUrl: template('posts/new')
          controller: 'PostsNewCtrl'
        .state 'posts.show',
          url: '/{id}'
          templateUrl: template('posts/show')
          controller: 'PostsShowCtrl'
      $urlRouterProvider.otherwise '/'
      return
    ]