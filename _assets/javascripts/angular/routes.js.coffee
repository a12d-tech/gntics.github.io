app = angular.module('routesModule', [])

app.config ['$stateProvider', '$urlRouterProvider',($stateProvider, $urlRouterProvider)->

  $urlRouterProvider.otherwise ->
    '/'

  $stateProvider
    .state 'index',
      url: '/'
      templateUrl: 'templates/index.html'

  $stateProvider
    .state 'all',
      url: '/all'
      controller: 'UsersController as usersCtrl'
      resolve:
        users: [ 'User', (User) ->
          User.all().then (response)->
            response.data
        ]
      templateUrl: 'templates/users.html'

  $stateProvider
    .state 'accessToken',
      url: '/access_token=:response'
      controller: [ '$window', '$state', '$stateParams', 'accessToken', ($window, $state, $stateParams, accessToken) ->
        token = $stateParams.response.match(/^(.*?)&/)[1]
        accessToken.set(token)

        $state.go 'index'
      ]
]