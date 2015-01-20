app = angular.module('accessTokenModule',[])

app.service 'accessToken', ['$localStorage', '$timeout', ($localStorage, $timeout) ->
  get:         -> $localStorage.token
  set: (token) -> $localStorage.token = token
  delete:      -> delete $localStorage.token
]