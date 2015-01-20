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

# {
#   "name":"Gntics",
#   "description":"Bonjour moi c'est pierre alors voila un peu ce que je peux raconter sur moi ma vie et ma passion du web et blablabalbalbalabla",
#   "experiences":[
#     { "job_title":"Web Software engineer - Ruby on rails",
#       "start_date":"2011-04-08",
#       "end_date":"2012-03-10",
#       "current_position":false,
#       "accomplishments_description":"- blabalbalaj\r\n- caouiacaclkcajlkcz ajzcazczjbc\r\n- hsqqdsjkhqs qdsjkhdqs *szda* djalddz\r\n- dkjhqsjhqskdjh qskjh JKGQS JHG QKJHGli Ljh Ljhlkjh ljhqljhqd ",
#       "employer":
#         { "name":"Nike",
#           "city":"New York",
#           "country":"USA",
#           "website_url":"http://www.nike.com",
#           "description":"une petite societe americaine de sports"
#         }
#     },
#     { "job_title":"Software engineer - Ruby on rails",
#       "start_date":"2010-01-06",
#       "end_date":"2010-10-22",
#       "current_position":false,
#       "accomplishments_description":"azekjlazkjaze\r\neazlkjzaùklzjae\r\nazlkajzelaze\r\nazazeeazea\r\nazelkjazejlkzaje\r\nazekjlaelkazjea\r\nsqddqqddqsdqs",
#       "employer":
#         { "name":"Adidas",
#           "city":"Paris",
#           "country":"FRANCE",
#           "website_url":"http://www.adidas.com",
#           "description":"une petite societe qui produit des vetements et des chaussures de sport"
#         }
#     }
#   ],
#   "educations":[
#     { "name":"Secondaire",
#       "website_url":"http://www.google.fr",
#       "start_date":"2012-05-16",
#       "end_date":"2014-02-04",
#       "description":"*blalkaj lzfhqdlksjh dkljhf\r\nsqlmksqmlksqdmjqd\r\nqdlqkdjlqkdqs\r\nsdqdqd\r\n\r\n*adzkjzldakjz\r\nlqskjdqlkjqsd\r\nqsksqjdlqs\r\n"
#     },
#     { "name":"Ecole primaire",
#       "website_url":"http://coucou.fr",
#       "start_date":"2009-02-05",
#       "end_date":"2011-05-06",
#       "description":"c'etait super mais grave"
#     }
#   ]
# }
