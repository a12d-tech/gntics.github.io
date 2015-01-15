app = angular.module('authenticationModule', [])

app.controller 'AuthenticationController', [ '$state', 'accessToken', 'initConfig', 'User', ($state, accessToken, initConfig, User) ->
  @loginUrl = "//#{initConfig.host}/oauth/authorize?response_type=token&client_id=#{initConfig.app_id}&redirect_uri=#{initConfig.redirect_uri}"
  @loggedIn = false

  ctrlScope = this
  ctrlScope.currentUser = null

  @getUserInfo = ->
    User.current().then (response) ->
      ctrlScope.currentUser = response.data

  @setLoggedIn = (isLoggedIn) ->
    @loggedIn = !!isLoggedIn

  @logout = ->
    User.logout().then ->
      accessToken.delete()
      @setLoggedIn false
      $state.go 'index'

  @setLoggedIn accessToken.get()
  @getUserInfo() if @loggedIn

]
