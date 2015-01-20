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

      ]
      templateUrl: 'templates/401.html'

]
