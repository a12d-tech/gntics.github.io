app = angular.module('initConfigModule', [])

app.service 'initConfig', ->
  settings = {
    'host': "localhost:3000"
    'app_id': 'b739b22361d4835a16a58ff9621c58bad2f17d89b37ecfe466ef87a0f55792b9'
    'redirect_uri': window.location
  }
  settings