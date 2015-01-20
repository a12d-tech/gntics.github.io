app = angular.module('initConfigModule', [])

app.service 'initConfig', ->
  settings = {
    'host': "https://fathomless-mesa-3591.herokuapp.com"
    'app_id': '56df0e7ec657576a9fe93759ed238aa9bf8ff8cfb68a7fcfc9eb989d7e84e1d0'
    'redirect_uri': window.location
  }
  settings

# 'host': "http://localhost:3000"
# 'app_id': 'b739b22361d4835a16a58ff9621c58bad2f17d89b37ecfe466ef87a0f55792b9'
