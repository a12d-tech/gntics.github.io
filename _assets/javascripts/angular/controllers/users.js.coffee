app = angular.module('usersModule', [])

app.controller 'UsersController', [ 'users', (users) ->
  @usersList = users
  @test = "coucou"
]