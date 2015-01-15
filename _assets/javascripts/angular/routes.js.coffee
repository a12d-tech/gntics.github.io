app = angular.module('routesModule', [])

app.config ['$stateProvider', '$urlRouterProvider',($stateProvider, $urlRouterProvider)->

  $urlRouterProvider.otherwise ->
    '/'

  $stateProvider
    .state 'index',
      url: '/'
      templateUrl: 'templates/index.html'

  $stateProvider
    .state 'welcome',
      url: '/welcome'
      controller: 'UserController as userCtrl'
      resolve:
        user: [ 'User', (User) ->
          User.me().then (response)->
            response.data
        ]
      templateUrl: 'templates/welcome.html'

  $stateProvider
    .state 'accessToken',
      url: '/access_token=:response'
      controller: [ '$window', '$state', '$stateParams', 'accessToken', ($window, $state, $stateParams, accessToken) ->
        token = $stateParams.response.match(/^(.*?)&/)[1]
        accessToken.set(token)

        $state.go 'welcome'
      ]

  $stateProvider
    .state '401',
      url: '/unauthorized'
      controller: [ '$state', 'accessToken', ($state, accessToken) ->
        # $state.go 'index' if accessToken.get()
        existingToken = accessToken.get()
        console.log existingToken
        if existingToken
          console.log "token exist"
          
      ]
      templateUrl: 'templates/401.html'

  # $stateProvider
  #   .state 'me',
  #     url: '/me'
  #     controller: 'UserController as userCtrl'
  #     resolve:
  #       user: [ 'User', (User) ->
  #         User.me().then (response)->
  #           response.data
  #       ]
  #     templateUrl: 'templates/me.html'
  #
  # $stateProvider
  #   .state 'all',
  #     url: '/all'
  #     controller: 'UsersController as usersCtrl'
  #     resolve:
  #       users: [ 'User', (User) ->
  #         User.all().then (response)->
  #           response.data
  #       ]
  #     templateUrl: 'templates/users.html'


]
