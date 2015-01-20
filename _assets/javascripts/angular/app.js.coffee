app = angular.module('resume', [
  'accessTokenModule'
  'ngStorage'
  'ui.router'
  'routesModule'
  'authenticationModule'
  'initConfigModule'
  'userModule'
  'usersModule'
  'ngSanitize'
])

app.config ['$interpolateProvider', ($interpolateProvider)->
  $interpolateProvider.startSymbol('//').endSymbol('//')
]

app.factory 'tokenInterceptor', ['accessToken','initConfig', ( accessToken, initConfig) ->
  request: (config) ->
    # intercept request and set token in request headers
    if config.url.indexOf("#{ initConfig.host }") == 0
      token = accessToken.get()
      config.headers['Authorization'] = "Bearer #{token}" if token
      config.headers['Accept'] = "application/json"
      config.headers['Access-Control-Allow-Credentials'] = true
      # it seems to be useless !! NTBChecked
      config.headers['Content-Type'] = "application/json; charset=utf-8"
    config
]

app.factory 'unauthorizedInterceptor', [ '$q', '$injector', ($q, $injector) ->
  response: (response) ->
    console.log "Response 401"  if response.status is 401
    response or $q.when(response)

  responseError: (rejection) ->
    if rejection.status is 401
      console.log "Response Error 401"
      $injector.get('$state').go('401')
    $q.reject rejection

]

app.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.interceptors.push('tokenInterceptor')
  $httpProvider.interceptors.push('unauthorizedInterceptor')
]
