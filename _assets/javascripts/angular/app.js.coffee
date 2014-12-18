app = angular.module('resume', [
  'mainModule'
  'accessTokenModule'
  'ngStorage'
  'ui.router'
  'routesModule'
  'authenticationModule'
  'initConfigModule'
  'userModule'
  'usersModule'
])

app.config ['$interpolateProvider', ($interpolateProvider)->
  $interpolateProvider.startSymbol('//').endSymbol('//')
]

app.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.interceptors.push('tokenInterceptor')
]

app.factory 'tokenInterceptor', ['accessToken','initConfig', ( accessToken, initConfig) ->
  request: (config) ->
    # intercept request and set token in request headers
    if config.url.indexOf("//#{ initConfig.host }") == 0
      token = accessToken.get()
      config.headers['Authorization'] = "Bearer #{token}" if token
      config.headers['Accept'] = "application/json"
      # config.headers['Access-Control-Allow-Credentials'] = true
      # it seems to be useless !! NTBChecked
      config.headers['Content-Type'] = "application/json; charset=utf-8"
    config
]

# settings = {
#   'host': "localhost:3000"
# }

# setting = {
#   'host': "localhost:3000",
#   'clientId': YOUR_CLIENT_ID
# }

# redirect_uri = window.location


# authHost = "http://" + setting.host
# resourceHost = "https://api." + setting.host

# endUserAuthorizationEndpoint = authHost + "/connect"

# authHost = "https://" + setting.host
# resourceHost = "https://api." + setting.host
