@app
  .factory 'Posts', [
    '$http'
    ($http) ->
      {
        getPage: (pageNo) ->
          pageNo || = 1
          $http.get('/api/posts?&page=' + pageNo).then (response) ->
            response.data
        getPost: (id) ->
          $http.get('/api/posts/' + id).then (response) ->
            response.data
        getSearch: (request) ->
          $http.get('/api/posts?search=' + request).then (response) ->
            response.data
      }
  ]