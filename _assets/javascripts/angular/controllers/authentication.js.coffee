app = angular.module('authenticationModule', [])

app.controller 'AuthenticationController', [ '$state', 'accessToken', 'initConfig','User', ($state, accessToken, initConfig, User) ->
  @loginUrl = "//#{initConfig.host}/oauth/authorize?response_type=token&client_id=#{initConfig.app_id}&redirect_uri=#{initConfig.redirect_uri}"
  @loggedIn = false

  @setLoggedIn = (isLoggedIn) ->
    @loggedIn = !!isLoggedIn

  @setLoggedIn accessToken.get()

  @logout = ->
    User.logout().then ->
      accessToken.delete()
      @setLoggedIn false
      $state.go 'index'

]
