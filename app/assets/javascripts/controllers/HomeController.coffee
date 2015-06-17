angular
  .module('blog')

  .controller 'HomeCtrl', [
    '$scope'
    ($scope) ->
      $scope.posts = posts
  ]

posts = [
  {
    id: 1
    title: 'First post'
    cover: 'http://www.ocpsoft.org/wp-content/uploads/2013/01/angularjs.png'
    body: 'HTML is great for declaring static documents, but it falters when we try to use it for declaring dynamic views in web-applications. AngularJS lets you extend HTML vocabulary for your application. The resulting environment is extraordinarily expressive, readable, and quick to develop.'
  }
  {
    id: 2
    title: 'Second post'
    cover: 'http://www.ocpsoft.org/wp-content/uploads/2013/01/angularjs.png'
    body: 'Other frameworks deal with HTML’s shortcomings by either abstracting away HTML, CSS, and/or JavaScript or by providing an imperative way for manipulating the DOM. Neither of these address the root problem that HTML was not designed for dynamic views.'
  }
  {
    id: 3
    title: 'Extensibility'
    cover: 'http://www.ocpsoft.org/wp-content/uploads/2013/01/angularjs.png'
    body: 'AngularJS is a toolset for building the framework most suited to your application development. It is fully extensible and works well with other libraries. Every feature can be modified or replaced to suit your unique development workflow and feature needs. Read on to find out how.'
  }
  {
    id: 4
    title: 'Moving Angular Templates into the Asset Pipeline'
    cover: 'http://www.ocpsoft.org/wp-content/uploads/2013/01/angularjs.png'
    body: 'Right now all of our Angular templates are inlined in our applications layout. This is fine for now, but can become hard to organize as we add more views to our app. Luckily, there is a gem called angular-rails-templates that takes html templates and compiles them into javascript files that insert our templates into Angulars $templateCache. This allows us to move our templates into the app/assets/javascripts folder while referencing them in our app using the same syntax. Well be grouping our files in the javascripts folder by feature. Having templates and javascript in the same folder may seem weird if youre used to Rails directory structure, but it will make our project easier to navigate. See 1 in this list of top AngularJS mistakes.'
  }
  {
    id: 5
    title: 'Generating ActiveRecord Models'
    cover: 'http://www.ocpsoft.org/wp-content/uploads/2013/01/angularjs.png'
    body: 'AngularJS is a toolset for building the framework most suited to your application development. It is fully extensible and works well with other libraries. Every feature can be modified or replaced to suit your unique development workflow and feature needs. Read on to find out how.'
  }
]