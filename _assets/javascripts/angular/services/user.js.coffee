app = angular.module('userModule', [])

app.service 'User', ['$http','initConfig', ($http, initConfig)->
  host     = "#{ initConfig.host }"
  api      = "/api/v1"
  resource = "/users"
  baseRoot = host + api
  urlRoot  = host + api + resource

  me:     -> $http.get( urlRoot + '/me' )
  current:-> $http.get( baseRoot + '/current' )

]
