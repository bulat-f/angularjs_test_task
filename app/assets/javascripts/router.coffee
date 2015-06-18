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
          resolve:
            posts: ['$http', ($http) ->
              $http.get('/posts').then (response) ->
                response.data
            ]
        .state 'page',
          url: '/page/{id}'
          templateUrl: template('home')
          controller: 'HomeCtrl'
          resolve:
            posts: ['$http', '$stateParams', ($http, $stateParams) ->
              $http.get('/posts?page=' + $stateParams.id).then (response) ->
                response.data
            ]
        .state 'posts',
          url: '/posts/{id}'
          templateUrl: template('posts')
          controller: 'PostsCtrl'
          resolve:
            post: ['$http', '$stateParams', ($http, $stateParams) ->
              $http.get('/posts/' + $stateParams.id).then (response) ->
                response.data
            ]
      $urlRouterProvider.otherwise '/'
      return
    ]