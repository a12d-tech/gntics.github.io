app = angular.module('usersModule', [])

app.controller 'UserController', [ 'user', 'User', (user, User) ->

  @name = user.name
  @desc = user.description
  @experiences = user.experiences
  @educations = user.educations
  @skills = user.skills
  @languages = user.languages
  @interests = user.interests

  ctrlScope = this
  ctrlScope.currentUser = null

  @getUserInfo = ->
    User.current().then (response) ->
      ctrlScope.currentUser = response.data

  @getUserInfo()

  $(".open-popup-link").magnificPopup
    type: "inline"
    midClick: true
    removalDelay: 300
    mainClass: 'mfp-fade'

  return

]

app.filter "nl2br", ($filter) ->
  (data) ->
    return data  unless data
    data.replace /\r\n?/g, "<br/>"

app.filter "formatDate", ($filter) ->
  (data, comparedDate) ->
    return data  unless data
    start = data.split('-')
    end = comparedDate.split('-')
    if start[0] is end[0]
      return start[0]
    else
      return start[0] + ' - ' + end[0]
