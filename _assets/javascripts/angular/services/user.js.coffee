app = angular.module('userModule', [])

app.service 'User', ['$http','initConfig', ($http, initConfig)->
  urlRoot = "//#{ initConfig.host }/api/v1/users"

  all:    -> $http.get(urlRoot)
  me:     -> $http.get(urlRoot + '/me')
  logout: -> $http.delete(urlRoot + '/logout')
]